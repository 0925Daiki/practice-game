Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams
  resources :games do
    get 'search', to:'games#search'
    resources :messages, only:[:index, :create]
  end


end
