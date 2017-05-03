Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'busquedas#indice'
  get "/busquedas", to: "busquedas#indice"
  post "/", to: "busquedas#indice"
end
