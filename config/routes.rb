Rails.application.routes.draw do
  root "dragonborns#index"

  resources :dragonborns, only: [:index, :show, :new, :create] do
    resources :quests, only: [:index, :create, :destroy]
  end
  resources :cities, only: [:index, :show]
end
