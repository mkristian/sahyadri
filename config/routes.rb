ActionController::Routing::Routes.draw do |map|
  map.resources :audits

  map.resource :authentication

  map.resource :configuration

  map.resources :locales

  map.resources :locales

  map.resources :word_bundles

  map.resources :phrases

  map.resources :domains

  map.resources :domains

  map.resources :groups

  map.resources :groups

  map.resources :users

  map.resources :users

  map.resources :permissions

  map.resources :books
  map.connect 'books', :controller => :books, :action => 'logout'

end
