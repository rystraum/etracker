Etracker::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config

  match "generate_barcode"         => "units#barcode_generate"
  match "available_barcode"        => "units#barcodes_available"
  post  "/search_unit"             => "search#unit"
  match "/search"                  => "search#index"

  resources :units
  resources :locations
  resources :items

  root :to => 'home#index'
end