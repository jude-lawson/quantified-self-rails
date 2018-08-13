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

  describe 'GET /api/v1/food/:id' do
    it 'should return a single food if found' do
      
    end

    it 'should return 404 if not found' do

    end
  end
end
