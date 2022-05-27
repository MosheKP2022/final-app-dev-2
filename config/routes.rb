Rails.application.routes.draw do

  resources :labeled_offerings
  resources :tags
  resources :contact_us_messages
  resources :comments
  resources :offerings
  devise_for :users
  root "home#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
