Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Foods
      get '/foods', to: 'foods#index'
      get '/foods/:id', to: 'foods#show'
      post '/foods', to: 'foods#create'
      patch '/foods/:id', to: 'foods#update'
      delete '/foods/:id', to: 'foods#destroy'

      # Meals
      get '/meals', to: 'meals#index'
      get '/meals/:meal_id/foods', to: 'meals#show'
    end
  end
end
