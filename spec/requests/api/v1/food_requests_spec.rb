require 'rails_helper'

RSpec.describe 'Food Requests' do
  describe 'GET /api/v1/foods' do
    it 'should return all of the foods currently in the database' do
      food1 = Food.create!(name: 'Banana', calories: 150)

      get '/api/v1/foods'

      expect(response).to be_successful
      expect(response.body).to eq([food1].to_json)
    end
  end
end
