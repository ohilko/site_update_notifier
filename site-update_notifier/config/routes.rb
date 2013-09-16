SiteUpdateNotifier::Application.routes.draw do
  root to: "sessions#new"
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match "/logout", to: "sessions#destroy", :as => "logout", via: [:get, :post]
  resources :identities
  resources :microposts
  resources :users

end

