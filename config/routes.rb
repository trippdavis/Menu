Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  root "recipes#index"
  resources :recipes
end
