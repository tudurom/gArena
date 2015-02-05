Rails.application.routes.draw do
  resources :courses

  resources :lessons

  resources :posts
  root :to => "posts#index"

  resource :users do
    get 'users', :show
    get 'users/manage', :manage
    get 'users/test_alert', :test_alert
    match "users/:id" => 'users#destroy', :via => :delete
    get 'users/manage/:id' => "users#update"
    get 'users/makeadmin' => 'users#admin'
    get 'users/demote' => 'users#demote'
  end
  resource :user, only: [:edit] do
    collection do
      patch 'update'
    end
  end
  devise_for :users
end
