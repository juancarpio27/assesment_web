Rails.application.routes.draw do

  devise_for :employees
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :employee do
    root to: "devise/sessions#new"
  end

  resources :stores, only: [:show] do
    resources :product_stores
    resources :orders do
      member do
        post 'deliver'
        post 'cancel'
      end
    end
  end


  namespace :api do
    resources :stores, only: [:index, :show]
    resources :users, only: [:create]
    resources :categories, only: [:index]
    resources :product_stores, only: [] do
      collection {
        post 'get_products_by_category'
      }
    end

    resources :orders, only: [:create,:index,:show]

    resources :offers, only: [:index]

    resource :sessions, only: [:destroy] do
      collection {
        post 'plain'
      }
    end

    resources :cards, only: [:index, :create, :destroy]
  end

end
