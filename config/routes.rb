Rails.application.routes.draw do
  get 'home/index'
  root "home#index"

  devise_for :admins, :only => [:sessions]#, :only => [:sessions, :passwords, :registrations]
  as :admin do
    get 'admins/edit' => 'admins/registrations#edit', :as => 'edit_admin_registration'
    put 'admins' => 'admins/registrations#update', :as => 'admin_registration'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, except: [:destroy] do 
    resources :profiles, only: [:edit, :update]
  end

  resources :admins, except: [:destroy] do
    resources :profiles, only: [:edit, :update]
  end

  get '/load_squads' => 'manage_games#load_squads'

  resources :manage_users
  resources :teams
  resources :games do 
    member do
      put 'update_game'
      patch 'update_game'
    end
  end
  resources :codes, :path => "forms"
  resources :locations
  resources :squads
  resources :players do 
    member do
      get 'profile'
    end
  end

  resources :manage_games

  resources :countries
  resources :umpires
  resources :series
  
  get 'squad-select' => 'squads#get_squad_select'
  get 'game-innings' => 'games#get_games_innings'
  get 'squad-load-1' => 'squads#load_squad_1'
  get 'squad-load-2' => 'squads#load_squad_2' 
  get 'squad-save' => 'squads#save_squad'  
  
  get 'scoring' => 'games#scoring'
  patch 'scoring' => 'games#scoring_save'
  get 'load-innings' => 'games#load_innings'
  patch 'load-scores' => 'games#load_scores'
  
  get 'display-teams' => 'teams#display_teams'
  get 'team-builder' => 'teams#team_builder'
  get 'user-team-builder' => 'teams#user_team_builder'
  post 'team-builder' => 'teams#team_builder_save'
  post 'user-team-builder' => 'teams#team_builder_save'
  
  get 'load-teams' => 'teams#load_teams'
  get 'load-team' => 'teams#load_team'
  
  get 'load-game-squads' => 'games#load_game_squads'
  get 'load-game-squad' => 'games#load_game_squad'

  get 'get_players' => 'countries#get_players'

  get 'remove_player' => 'squads#remove_player'

  get 'quick_add_game_type' => 'games#quick_add_game_type'
  post 'save_quick_add_game_type' => 'games#save_quick_add_game_type'

  get 'quick_add_country' => 'games#quick_add_country'
  post 'save_quick_add_country' => 'games#save_quick_add_country'

  get 'quick_add_series' => 'games#quick_add_series'
  post 'save_quick_add_series' => 'games#save_quick_add_series'
  
  get 'quick_add_location' => 'games#quick_add_location'
  post 'save_quick_add_location' => 'games#save_quick_add_location'

  get 'quick_add_player' => 'games#quick_add_player'
  post 'save_quick_add_player' => 'games#save_quick_add_player'

  get 'quick_add_squad' => 'games#quick_add_squad'
  post 'save_quick_add_squad' => 'games#save_quick_add_squad'

  get 'quick_add_existing_player' => 'games#quick_add_existing_player'
  post 'save_existing_player' => 'games#save_existing_player'

  get 'get_squads' => 'squads#get_squads'

  get 'get_innings' => 'codes#get_innings'

  get 'get_countries' => 'countries#get_countries'

  get 'get_series' => 'series#get_series'

  get '/logout' => 'sessions#logout'

  

  
end