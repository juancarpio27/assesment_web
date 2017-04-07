Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landing#welcome'

  namespace :admin do
    resources :stores do
      resources :product_stores
    end
  end

  namespace :api do
    resources :stores do
      #COLLECTION muchos
      #MEMBER jala el :id
      #Jalamesta
      member {
        post 'over_price'
      }
    end
  end

end
