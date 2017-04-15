Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#welcome'

  namespace :api do
    resources :stores, only: [:index, :show]
    resources :users, only: [:create]

    resource :sessions, only: [:destroy] do
      collection {
        post 'plain'
      }
    end

    resources :cards, only: [:index, :create, :destroy]

  end

end
