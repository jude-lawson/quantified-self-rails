class Api::V1::MealFoodsController < ApplicationController
  def create
    begin
      meal = Meal.find(params[:meal_id])
      food = Food.find(params[:id])
      MealFood.create!(meal: meal, food: food)
      render json: { message: "Successfully added #{food.name} to #{meal.name}" }, status: 201
    rescue => error
      if error.to_s.include?('Couldn\'t find Meal')
        render json: { error: 'Meal not found' }, status: 404
      elsif error.to_s.include?('Couldn\'t find Food')
        render json: { error: 'Food not found' }, status: 404
      end
    end
  end
end
