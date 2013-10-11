SiteUpdateNotifier::Application.routes.draw do
  resources :relationships

  root to: 'static_pages#home'

  match '/help',    to: 'static_pages#help', via: [:get, :post]
  match '/about',   to: 'static_pages#about', via: [:get, :post]
  match '/contact', to: 'static_pages#contact', via: [:get, :post]

  match 'sessions/new', to: 'sessions#new', via: [:get, :post]
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match "/logout", to: "sessions#destroy", :as => "logout", via: [:get, :post]

  resources :identities
  resources :microposts
  resources :users
  resources :resources
  resources :resource

end

