require 'rails_helper'

describe PlayDateService, :vcr do
  it 'updates play date' do
    result = PlayDateService.update_play_date(3, 1)

    expect(result).to be_empty
  end

  it 'searches by id' do
    result = PlayDateService.search_by_id(4)

    expect(result).to be_a Hash
  end
end
