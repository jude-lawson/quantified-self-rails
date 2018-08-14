class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all
  end

  def show
    begin
      food = Food.find(params[:id])
      render json: food
    rescue
      render json: { error: 'Item not found' }, status: 404
    end
  end

  def create
    new_food_data = JSON.parse(request.body.string)['food']
    begin
      new_food = Food.create!(new_food_data)
      render json: new_food
    rescue => error
      if error.class == ActiveRecord::RecordInvalid
        render json: { error: error.to_s }, status: 400
      else
        render json: { error: 'Item not created' }, status: 400
      end
    end
  end

  def update
    begin
      Food.find(params[:id]).update(JSON.parse(request.body.string)['food'])
      render json: Food.find(params[:id])
    rescue
      render json: { error: 'Food not updated' }, status: 400
    end
  end
end

