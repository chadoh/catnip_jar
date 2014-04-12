Rails.application.routes.draw do
  resources :treats

  root to: 'treats#index'
end
