# == Route Map
#

Rails.application.routes.draw do
  devise_for :users

  root "offerings#index"

  resources :labeled_offerings
  resources :tags
  resources :contact_us_messages
  resources :comments
  resources :offerings

 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
