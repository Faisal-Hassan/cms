Rails.application.routes.draw do
  
  get 'sections/index'

  get 'sections/show'

  get 'sections/new'

  get 'sections/edit'

  get 'sections/delete'

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

  get 'home/about'

  get 'home/contact'
  
  get 'demo/lynda'
  
  get 'demo/hi'
  
  get 'demo/hello'

  get 'demo/index'
  
  root 'demo#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
