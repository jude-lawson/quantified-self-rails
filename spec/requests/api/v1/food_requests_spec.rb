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

  describe 'POST /api/v1/foods' do
    it 'should create a new food and return that object' do
      # Given this data
      new_food_data = { "food": { "name": "Dumplings", "calories": 900} }.to_json
      # Should return this object from databse
      new_food = Food.new(name: "Dumplings", calories: 900)

      post '/api/v1/foods', params: new_food_data

      expect(response).to be_successful
      expect(response.body).to eq(new_food.to_json)
    end

    it 'should return 404 with error message if fodd creation is not successful' do
    end

    it 'should fail if the name is not included' do
    end

    it 'should fail if the calories count is not included' do
    end
  end
end
