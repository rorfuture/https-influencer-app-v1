Rails.application.routes.draw do
  get 'auth/callback'
  devise_for :users, controller: {sessions: "sessions", registrations: "registrations"}
  get 'pages/about'
  get 'pages/contact'
  get 'pages/tc'
  get 'pages/privacy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  get '/auth/:provider/callback', to: 'auth#callback'
end
