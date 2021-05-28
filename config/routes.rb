Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams
  resources :games, only:[:index, :new, :create, :show] do
    resources :messages, only:[:create]
  end


end
