ActionController::Routing::Routes.draw do |map|

  map.resources :books
  map.connect 'books', :controller => :books, :action => 'logout'

  map.resource :configuration

  map.resource :authentication

  map.resources :locales

  map.resources :groups

  map.resources :users

  map.resources :permissions

  map.resources :phrases

  map.resources :word_bundles

end
