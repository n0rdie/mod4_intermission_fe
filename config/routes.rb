Rails.application.routes.draw do
  root "welcome#index"
  resources :news, only: [:index]
end
