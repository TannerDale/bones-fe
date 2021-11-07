class SessionsFacade
  class << self
    def sign_in(id)
      SessionsService.sign_in(id)
    end
  end
end
