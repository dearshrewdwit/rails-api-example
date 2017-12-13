Rails.application.routes.draw do

  defaults format: :json do
    namespace :api do
      resources :players, only: [:index, :show, :create, :update, :destroy] do
        resources :titles, only: [:index]
      end
    end
  end

end
