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
      new_food_data = { "food": { "name": "Dumplings", "calories": 900 } }.to_json
      
      post '/api/v1/foods', params: new_food_data

      expect(response).to be_successful
      expect(response.body).to eq(Food.last.to_json)
    end

    it 'should return 404 with error message if food creation is not successful' do
      broken_food = { "food": "Dumplings" }.to_json

      post '/api/v1/foods', params: broken_food

      expect(response).to have_http_status(400)
      expect(response.body).to eq({ error: 'Item not created' }.to_json)
    end

    it 'should fail if the name is not included' do
      no_name_food = { "food": { "calories": 900 } }.to_json

      post '/api/v1/foods', params: no_name_food

      expect(response).to have_http_status(400)
      expect(response.body).to eq({ error: 'Validation failed: Name can\'t be blank' }.to_json)
    end

    it 'should fail if the calories count is not included' do
      no_name_food = { "food": { "name": "Dumplings" } }.to_json

      post '/api/v1/foods', params: no_name_food

      expect(response).to have_http_status(400)
      expect(response.body).to eq({ error: 'Validation failed: Calories can\'t be blank' }.to_json)
    end
  end
end
