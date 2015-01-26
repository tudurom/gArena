Rails.application.routes.draw do
  resources :posts
  root :to => "posts#index"  
	
  resource :users do
    get 'users', :show
    get 'users/manage', :manage
  end
  devise_for :users
end
