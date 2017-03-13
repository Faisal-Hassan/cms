Rails.application.routes.draw do
  
  get 'admin_users/index'

  get 'admin_users/new'

  get 'admin_users/edit'

  get 'admin_users/delete'

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

  get 'home/contact'
  
  root 'home#about'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
