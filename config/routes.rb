# == Route Map
#

Rails.application.routes.draw do
  root "offerings#index"

  devise_for :users

  resources :saves
  resources :family_members
  resources :kids
  resources :labeled_offerings
  resources :tags
  resources :contact_us_messages
  resources :comments
  resources :offerings

 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
