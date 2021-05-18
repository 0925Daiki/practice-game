Rails.application.routes.draw do
  devise_for :users
  get 'teams/index'
  root to: "teams#index"
  resources :teams, only:[:index, :new, :create, :show]

end
