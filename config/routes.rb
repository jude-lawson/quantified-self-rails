Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/foods', to: 'foods#index'
      get '/foods/:id', to: 'foods#show'
      post '/foods', to: 'foods#create'
      patch '/foods/:id', to: 'foods#update'
      delete '/foods/:id', to: 'foods#destroy'
    end
  end
end
