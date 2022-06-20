# == Route Map
#

Rails.application.routes.draw do

  root "offerings#index"

 
  devise_for :users

  resources :family_members
  resources :kids
  resources :labeled_offerings
  resources :tags
  resources :contact_us_messages
  resources :comments
  resources :offerings
  resources :saves
  # resources :users, only: :show


  get "users/profile" => "users#profile", as: :user
  # get ":username/liked" => "users#liked", as: :liked
  # get ":username/feed" => "users#feed", as: :feed
  # get ":username/discover" => "users#discover", as: :discover
  # get ":username/followers" => "users#followers", as: :followers
  # get ":username/following" => "users#following", as: :following

 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
