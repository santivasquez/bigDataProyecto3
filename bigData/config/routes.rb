Rails.application.routes.draw do
  resources :archivos
    
    root 'archivos#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
