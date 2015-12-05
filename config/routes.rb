Rails.application.routes.draw do
  resources :games
  resources :codes, :path => "forms"
  resources :locations
  resources :squads
  resources :players
  resources :countries
  

  # You can have the root of your site routed with "root"
   root 'games#index'

  
end
