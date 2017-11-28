Rails.application.routes.draw do
    root "dragonborns#index"

    resources :dragonborns, only: [:index, :show, :new, :create] do
      resources :quests, only: [:create]
  end
end
