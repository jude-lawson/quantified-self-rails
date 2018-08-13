require 'rails_helper'

RSpec.describe 'Food Requests' do

  before :each do
    @food1 = Food.create!(name: 'Banana', calories: 150)
    @food2 = Food.create!(name: 'Pumpkin Pie', calories: 800)
  end

  describe 'GET /api/v1/foods' do
    it 'should return all of the foods currently in the database' do

      get '/api/v1/foods'

      expect(response).to be_successful
      expect(response.body).to eq([@food1, @food2].to_json)
    end
  end

  describe 'GET /api/v1/food/:id' do
    it 'should return a single food if found' do

    end

    it 'should return 404 if not found' do

    end
  end
end
