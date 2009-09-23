ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

require 'shoulda'
require 'factory_girl'
require 'test/factories'
require "authlogic/test_case"

require "webrat"

Webrat.configure do |config|
  config.mode = :rails
end

ActionController::TestCase.class_eval do
  setup :activate_authlogic
end

class ActiveSupport::TestCase
  
  # self.use_transactional_fixtures = true
  # self.use_instantiated_fixtures  = false
  # fixtures :all
  
  def login_as(login)
    UserSession.create(Factory.create(:user,:login => login))
    UserSession.find
  end
  
end