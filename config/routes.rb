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
  end

  resources :credit_cards, only: [:index, :new, :create, :destroy]



  resources :items do 
  #Ajaxで動くアクションのルートを作成
  collection do
    get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
  end
end
end