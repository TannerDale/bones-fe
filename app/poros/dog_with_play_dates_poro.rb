class DogWithPlayDatesPoro
  attr_reader :id,
              :name,
              :breed,
              :size,
              :age,
              :vaccinated,
              :trained,
              :user_id,
              :sex,
              :accepted_play_dates,
              :pending_play_dates

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @breed = data[:attributes][:breed]
    @size = data[:attributes][:size]
    @age = data[:attributes][:age]
    @vaccinated = data[:attributes][:vaccinated]
    @trained = data[:attributes][:trained]
    @sex = data[:attributes][:sex]
    @user_id = data[:attributes][:user_id]
    @accepted_play_dates = play_date_poros(data[:attributes][:accepted_play_dates])
    @pending_play_dates = play_date_poros(data[:attributes][:pending_play_dates])
  end

  private

  def play_date_poros(data)
    data.map do |pd|
      PlayDatePoro.new(pd)
    end
  end
end
