Rails.application.routes.draw do
  get 'subjects/index'

  get 'subjects/show'

  get 'subjects/new'

  get 'subjects/edit'

  get 'subjects/delete'

  get 'home/about'

  get 'home/contact'
  
  get 'demo/lynda'
  
  get 'demo/hi'
  
  get 'demo/hello'

  get 'demo/index'
  
  root 'demo#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
