class PlayDateService
  class << self
    def create_play_date(json)
      BackendClient.create_play_date(json)
    end

    def find_for_user(id, status)
      url = "/api/v1/play_dates?user_id=#{id}&status=#{status}"

      BackendClient.fetch(url)[:data]
    end

    def update_play_date(id, status)
      url = "/play_dates/#{id}"
      body = { status: status }.to_json

      BackendClient.update_play_date(url, body)
    end
  end
end
