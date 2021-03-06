ActionController::Routing::Routes.draw do |map|
  



  map.root :controller => "index"
  
  # wiki related
  map.resources :wikis
  
  # catalog related
  # map.resources :catalogs
  map.resources :wines
  map.resources :regions
  
  # forum related
  map.resources :forums
  
  # shop related
  map.resources :shops
  map.resource  :shopcarts
  
  # bid related
  map.resources :bids
  
  # account related 
  map.resource  :account, :controller => "users"
  map.resource  :user_session
  map.resources :users
  map.resources :password_resets
  map.signup '/signup',  :controller => "users",         :action => 'new'
  map.login  '/login',   :controller => 'user_sessions', :action => "new"
  map.logout '/logout',  :controller => 'user_sessions', :action => "destroy"
  map.forgot_pwd '/forgot_password',  :controller => "password_resets", :action => "new" 
  map.upload_avatar      '/account/avatar',  :controller => "users", :action => "avatar"
  map.change_password '/account/password',:controller => "users", :action => "password"
  
  # management platform routes
  map.namespace :admin do |admin|
    
    admin.resource  :dashboards
    
    admin.resources :contents
    admin.resources :content_categories
    admin.resources :attacheds

    admin.resources :forums
    admin.resources :topics
    
    admin.resources :products
    admin.resources :orders
    
    admin.resources :wines
    admin.resources :wineries
    admin.resources :grapes
    
    admin.resources :users
    admin.resources :settings
  end
  
end
