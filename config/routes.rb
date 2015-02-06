Rails.application.routes.draw do
  resources :courses

  resources :lessons

  resources :posts
  root :to => "posts#index"

  resource :users do
    root :to => :show
    get 'manage', :manage
    get 'test_alert', :test_alert
    match "destroy/:id" => 'users#destroy', :via => :delete
    get 'manage/:id' => "users#update"
    get 'makeadmin' => 'users#admin'
    get 'demote' => 'users#demote'
  end
  resource :user, only: [:edit] do
    collection do
      patch 'update'
    end
  end
  devise_for :users
end
