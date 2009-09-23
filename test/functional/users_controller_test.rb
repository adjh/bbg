require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "should get new user instance" do
    get :new
    assert_response :success
    assert assigns(@user)
  end
  
  test "should create user" do
    assert_difference('User.count') do
      post :create, :user => Factory.attributes_for(:user)
    end
    assert_equal I18n.t("account.create_success"), flash[:notice]
    assert_redirected_to account_url
  end
  
  test "should show user" do
    login_as('bbg-tester')
    get :show
    assert assigns(@user)
    assert_response :success
  end
  
  test "should update user success" do
    u = login_as('bbg-tester')
    put :update, :user => { }
    assert_redirected_to account_url
    assert_equal I18n.t("account.update_success"), flash[:notice]
  end
  
  test "should update user failure" do
    u = login_as('bbg-tester')
    put :update, :user => {:login => "" }
    assert_template :show
  end
  
  test "should create new avatar" do
    u = login_as('bbg-tester')
    post :avatar, :user => {:avatar => fixture_file_upload('avatar-test.gif',  'image/gif')}
    assert_redirected_to upload_avatar_url
    assert_equal I18n.t("account.update_avatar_success"), flash[:notice]
    assert assigns(:user).avatar?
  end
  
  test "should update new password" do
    u = login_as('bbg-tester')
    post :password, :old_password => 'secretpwd', :user => {:password => 'newpassword',
      :password_confirmation => 'newpassword'}
    assert_redirected_to change_password_url
    assert_equal I18n.t("account.password_update_success"), flash[:notice]
    assert assigns(:user).valid_password?('newpassword')
  end
  
  test "should warning input the new password" do
    u = login_as('bbg-tester')
    post :password, :old_password => 'secretpwd', :user => {:password => nil}
    assert_redirected_to change_password_url
    assert_equal I18n.t("account.change_password_require"), flash[:warning]
  end
  
  test "should be notice the old password incorrect" do
    u = login_as('bbg-tester')
    post :password, :old_password => 'errorpwd'
    assert_template :password
    assert_equal I18n.t("account.password_not_match"), flash[:error]
  end
  
  test "should be notice new password invalid" do
    u = login_as('bbg-tester')
    post :password, :old_password => 'secretpwd', :user => {:password => 'pwd',
      :password_confirmation => 'pwd'}
    assert_template :password
    assert_not_nil assigns(:user).errors.on(:password)
    assert_not_nil assigns(:user).errors.on(:password_confirmation)
  end
  
end
