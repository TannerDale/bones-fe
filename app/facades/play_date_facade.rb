class PlayDateFacade
  class << self
    def create_play_date(json)
      PlayDateService.create_play_date(json)
    end
  end
end
