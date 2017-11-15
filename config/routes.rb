Rails.application.routes.draw do

  defaults format: :json do
    namespace :api do
      resources :players, only: [:index]
    end
  end
  
end
