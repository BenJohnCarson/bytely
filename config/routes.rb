Rails.application.routes.draw do

  root to: 'dashboard#index'
  resources :urls
  
  get ':short_code' => 'urls#show'
end
