Rails.application.routes.draw do

  get 'items/new'

  devise_for :users
  resources :users, only: [:update, :show] do
    resources :items, only: [:create, :destroy]
  end
  
  get 'about' => 'welcome#about'
  root to: 'welcome#index'

end
