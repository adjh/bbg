require 'test_helper'

class Admin::GrapesControllerTest < ActionController::TestCase
  
  test "should get new grape instance" do
    get :new
    assert_response :success
    assert assigns(:grape)
  end
  
  context "Create grape" do

    should "success and forward to grapes list" do
      assert_difference('Grape.count') do
        post :create, :grape => Factory.attributes_for(:grape)
      end
      assert_equal I18n.t('admin.flash.create_success', 
        :resource => Grape.human_name), flash[:notice]
      assert_redirected_to admin_grapes_url
    end
    
    should "failure and render the new page" do
      post :create
      assert_template :new
      assert_not_nil assigns(:grape).errors.on(:name_cn)
      assert_not_nil assigns(:grape).errors.on(:description)
    end
  end
  
  test "on GET to :index for grape list" do
    get :index
    assert_response :success
    assert assigns(:grapes)
  end
  
end
