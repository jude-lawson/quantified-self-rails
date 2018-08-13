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
end
