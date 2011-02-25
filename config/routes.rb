ActionController::Routing::Routes.draw do |map|

  map.connect 'bills', :controller => :bills, :action => 'index'
  
  map.connect 'bills/:dir', :controller => :bills, :action => 'index'
  
  map.connect 'bills/:file.:ext', :controller => :bills, :action => 'show'
  
  map.connect 'bills/:dir/:file.:ext', :controller => :bills, :action => 'show'
  
  map.resources :audits

  map.resource :authentication

  map.resource :configuration

  map.resources :locales

  map.resources :word_bundles

  map.resources :phrases

  map.resources :domains

  map.resources :groups

  map.resources :users

  map.resources :permissions

  map.resources :book_states
  map.connect 'book_states/:id', :controller => 'book_states', :action => :create, :conditions => { :method => [:delete, :put, :post] }

  map.resources :books
  map.connect 'books', :controller => :books, :action => 'logout'
  map.connect 'books/:id', :controller => 'books', :action => :show, :conditions => { :method => [:delete, :put, :post] }
  map.connect 'books/:id/edit', :controller => 'books', :action => :show, :conditions => { :method => [:post] }
  map.connect 'books/new', :controller => 'books', :action => :show, :conditions => { :method => [:post] }

end
