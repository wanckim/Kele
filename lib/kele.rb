require 'httparty'
require 'json'
require_relative 'roadmap.rb'
require_relative 'message.rb'

class Kele
  include HTTParty
  include JSON
  include Roadmap
  include Message

  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, pw)
    values = {
      "email": email,
      "password": pw
    }

    response = self.class.post('/sessions', body: values)
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get('/users/me', headers: { "authorization" => @auth_token })
    @user_hash = JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    values = { "id": mentor_id }

    response = self.class.get("/mentors/#{mentor_id}/student_availability", body: values, headers: { "authorization" => @auth_token })
    @available_time = JSON.parse(response.body)
  end

end
