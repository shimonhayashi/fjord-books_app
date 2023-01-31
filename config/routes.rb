Rails.application.routes.draw do
  get 'follow_relationships/followings'
  get 'follow_relationships/followers'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    root 'users/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: %i[index show]
  get 'users/:id' => 'users#show'

  resources :users do
    resource :follow_relationships, only: [:create, :destroy]
    get 'followings' => 'follow_relationships#followings', as: 'followings'
    get 'followers' => 'follow_relationships#followers', as: 'followers'
    member do
      get :followings, :followers
    end
  end
end
