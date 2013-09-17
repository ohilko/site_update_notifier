SiteUpdateNotifier::Application.routes.draw do
  get "static_pages/about"
  get "static_pages/home"
  get "static_pages/help"
  # root to: "sessions#new"
  root to: "static_pages#home"

  match 'sessions/new', to: 'sessions#new', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match "/logout", to: "sessions#destroy", :as => "logout", via: [:get, :post]
  resources :identities
  resources :microposts
  resources :users

end

