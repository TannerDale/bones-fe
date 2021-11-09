class PlayDateFacade
  class << self
    def create_play_date(json)
      PlayDateService.create_play_date(json)
    end

    def find_for_user(id, status = 'all')
      PlayDateService.find_for_user(id, status).map do |pd|
        InvitedPlayDatePoro.new(pd)
      end
    end

    def update_play_date(id, status)
      PlayDateService.update_play_date(id, status)
    end

    def my_play_dates(id)
      PlayDateService.my_play_dates(id).map do |play|
        InvitedPlayDatePoro.new(play)
      end
    end
  end
end
