Rails.application.routes.draw do

  root 'pages#home'
  get 'dashboard' => "pages#dashboard"
  devise_for :users
  resources :host_types
  resources :hosts

end
