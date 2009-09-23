require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create user session" do
    login  = Factory.create(:user, :login => "testsession",  :password => "testsession")
    post :create, :user_session => { :login => "testsession", :password => "testsession" }
    assert user_session = UserSession.find
    assert_equal login, user_session.user
    assert_redirected_to account_url
  end

  test "should destroy user session" do
    delete :destroy
    assert_nil UserSession.find
    assert_redirected_to login_url
  end

end
