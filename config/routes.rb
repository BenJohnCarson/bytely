Rails.application.routes.draw do

  root to: 'dashboard#index'
  resources :urls
end
