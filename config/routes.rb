Rails.application.routes.draw do
  devise_for :users
  root to: "teams#index"
  resources :teams
  resources :games do
    resources :messages, only:[:index, :create]
    get 'search', to:'games#search'
  end


end
