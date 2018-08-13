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
      get "/api/v1/foods/#{@food2.id}"

      expect(response).to be_successful
      expect(response.body).to eq(@food2.to_json)
    end

    it 'should return 404 if not found' do
      get "/api/v1/foods/#{@food2.id + 1}"

      expect(response).to have_http_status(404)
      expect(response.body).to eq({ error: 'Item not found' }.to_json)
    end
  end
end
