require 'httparty'

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, pw)

    values = {
      "email": email,
      "password": pw
    }

    response = self.class.post('/sessions', body: values)

    @auth_token = response["auth_token"]
  end
end
