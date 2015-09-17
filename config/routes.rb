Rails.application.routes.draw do

  get 'items/new'

  devise_for :users

  # resources :users, shallow: true do
  #   resources :lists do
  #     resources :items
  #   end
  # end

  resources :users, only: [:update, :show] do
    resources :lists, only: [:create, :destroy]
  end

  resources :lists, only: [] do
    resources :items, only: [:create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    resources :users do
      resources :lists
    end

    resources :lists, only: [] do
      resources :items, only: [:create]
    end

    resources :items, only: [:destroy, :index]
  end

  get 'about' => 'welcome#about'
  root to: 'welcome#index'

end
