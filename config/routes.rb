Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sending_destinations', to: 'users/registrations#new_sending_destinations'
    post 'sending_destinations', to: 'users/registrations#create_sending_destinations'
  end

  root 'items#index'




  resources :items, only: [:index, :show] do
    collection do
      get 'purchase'
      post 'pay'
    end
  end

  resources :credit_cards, only: [:index, :new, :create]

end