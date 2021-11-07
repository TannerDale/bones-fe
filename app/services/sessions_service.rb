class SessionsService
  class << self
    def sign_in(id)
      BackendClient.sign_in({ user_id: id }.to_json)
    end
  end
end
