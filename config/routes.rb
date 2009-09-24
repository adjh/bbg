ActionController::Routing::Routes.draw do |map|
  



  map.root :controller => "index"
  
  # wiki related
  map.resources :wikis
  
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
  
 
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
