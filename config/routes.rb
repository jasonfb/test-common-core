Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :hellos


  namespace :dashboard do
    resources :get_emails_rules
    resources :things
  end


end
