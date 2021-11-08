class PlayDateService
  class << self
    def create_play_date(json)
      BackendClient.create_play_date(json)
    end
  end
end
