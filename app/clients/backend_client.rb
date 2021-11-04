class BackendClient
  class << self
    def fetch(url)
      parse_data(conn.get(url))
    end

    def create_dog(json)
      post('dogs', json).body
    end

    private

    def post(url, json)
      conn.post do |req|
        req.url "/api/v1/#{url}"
        req.headers['Content-Type'] = 'application/json'
        req.body = json
      end
    end

    def conn
      # Faraday.new('http://bones-be.herokuapp.com')
      Faraday.new('http://localhost:5000')
    end

    def parse_data(response)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
