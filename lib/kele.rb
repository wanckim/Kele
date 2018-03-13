require 'httparty'
require 'json'

class Kele
  include HTTParty
  include JSON

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
end
