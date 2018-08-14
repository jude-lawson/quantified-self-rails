require 'rails_helper'

RSpec.describe 'Meal Requests' do

  before :each do
    @meal1 = Meal.create!(name: 'Breakfast')
    @food1 = @meal1.foods.create!(name: 'Cheerios', calories: 300)
    @food2 = @meal1.foods.create!(name: 'Strawberries', calories: 200)

    @meal2 = Meal.create!(name: 'Lunch')
    @food3 = @meal2.foods.create!(name: 'Ham Sandwich', calories: 800)
  end
  
  describe 'GET /api/v1/meals' do
    it 'should return all of the meals in the database' do
      expected = [
        {
          id: @meal1.id,
          name: @meal1.name,
          foods: [@food1, @food2]
        },
        {
          id: @meal2.id,
          name: @meal2.name,
          foods: [@food3]
        }
      ]

      get '/api/v1/meals'

      expect(response).to be_successful
      expect(response.body).to eq(expected.to_json) 
    end
  end

  describe 'GET /api/v1/meals/:meal_id/foods' do
    it 'should return all foods associated with the meal specified by the give meal_id' do
      expected = {
        id: @meal2.id,
        name: @meal2.name,
        foods: [@food3]
      }

      get "/api/v1/meals/#{@meal2.id}/foods"

      expect(response).to be_successful
      expect(response.body).to eq(expected.to_json)
    end

    it 'should return a 404 with an error message if the specified meal is not found' do
      get "/api/v1/meals/#{@meal2.id + 1}"

      expect(response).to have_http_status(404)
      expect(response.body).to eq({ error: "Meal not found" }.to_json)
    end
  end
end
