Rails.application.routes.draw do

  resources :admin_users, :except => [:show] do
  	member do
  		get :delete
  	end
  end

  get 'admin', :to => 'access#menu'
  
  get 'access/logout'
  
  post 'access/attempt_login'
  
  get 'access/menu'

  get 'access/login'

  resources :sections do
  	member do
  		get :delete
  	end
  end
  
  resources :pages do
   member do
     get :delete
   end
  end

  resources :subjects do
    member do
      get :delete
    end
  end
  
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  root :to => 'public#index'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
