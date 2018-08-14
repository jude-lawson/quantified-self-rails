require 'rails_helper'

RSpec.describe 'Meal Food Requests' do

  before :each do
    @meal1 = Meal.create!(name: 'Breakfast')
    @food1 = Food.create!(name: 'Toast', calories: 180)
  end
  
  describe 'POST /api/v1/meals/:meal_id/foods/:id' do
    it 'should add the food with specified id to the meal with specified meal_id' do
      post "/api/v1/meals/#{@meal1.id}/foods/#{@food1.id}"

      expect(Meal.find(@meal1.id).foods).to eq([@food1])
    end

    it 'should create a new record in the MealFoods table' do
      post "/api/v1/meals/#{@meal1.id}/foods/#{@food1.id}"

      expect(MealFood.last.meal_id).to eq(@meal1.id)
      expect(MealFood.last.food_id).to eq(@food1.id)
    end

    it 'should return a 404 with an error message if the meal cannot be found' do
      post "/api/v1/meals/#{@meal1.id + 1}/foods/#{@food1.id}"

      expect(response).to have_http_status(404)
      expect(response.body).to eq({ error: 'Meal not found' }.to_json)
    end

    it 'should return a 404 with an error message if the food cannot be found' do
      post "/api/v1/meals/#{@meal1.id}/foods/#{@food1.id + 1}"

      expect(response).to have_http_status(404)
      expect(response.body).to eq({ error: 'Food not found' }.to_json)
    end

    it 'should return a 201 and a success message if successful' do
      post "/api/v1/meals/#{@meal1.id}/foods/#{@food1.id}"

      expect(response).to have_http_status(201)
      expect(response.body).to eq({ message: "Successfully added #{@food1.name} to #{@meal1.name}" }.to_json)
    end
  end
end
