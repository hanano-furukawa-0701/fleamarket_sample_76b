Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destinations'
    post 'sending_destinations', to: 'users/registrations#create_sending_destinations'
  end

  root 'items#index'
  resources :users,only: [:show]
  resources :items do
    member do
      get 'purchase', to: 'items#purchase'
      post 'pay', to: 'items#pay'
      get 'done', to: 'items#done'
    end
    resources :comments, only: [:create, :destroy]
  end

  resources :credit_cards, only: [:index, :new, :create, :destroy]

end
