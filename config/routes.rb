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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
