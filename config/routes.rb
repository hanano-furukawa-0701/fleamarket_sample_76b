Rails.application.routes.draw do


  root 'items#index'
  resources :users,only: [:show]
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destinations'
    post 'sending_destinations', to: 'users/registrations#create_sending_destinations'
  end

  root 'items#index'




  resources :items, only: [:index, :show] do
    member do
      get 'purchase', to: 'items#purchase'
      post 'pay', to: 'items#pay'
      get 'done', to: 'items#done'
    end
  end

  resources :credit_cards, only: [:index, :new, :create, :destroy]

end
