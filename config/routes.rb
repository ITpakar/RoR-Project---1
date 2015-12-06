Rails.application.routes.draw do
  resources :teams
  resources :games
  resources :codes, :path => "forms"
  resources :locations
  resources :squads
  resources :players
  resources :countries

  root 'games#index'

  get 'squad-select' => 'squads#get_squad_select'
  get 'squad-load-1' => 'squads#load_squad_1'
  get 'squad-load-2' => 'squads#load_squad_2' 
  get 'squad-save' => 'squads#save_squad'
  
end
