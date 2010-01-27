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
    
    should "failured with blank params and render the new page" do
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
  
  test "on GET to :edit a grape instance" do
    grape = Factory.create(:grape)
    get :edit,  :id => grape.id
    assert_response :success
    assert assigns(:grape)
  end
  
  context "Update grape" do
    
    should "success and forward to grapes list" do
      grape = Factory.create(:grape, :name_en => 'update test')
      put :update, :id => grape.id,  :grape => {:name_en => 'update success'}
      assert_equal assigns(:grape).name_en, 'update success'
      assert_equal I18n.t('admin.flash.update_success', 
        :resource => Grape.human_name), flash[:notice]
      assert_redirected_to edit_admin_grape_path(assigns(:grape))
    end
    
    should "failured with nil name_cn and render the edit page" do
      grape = Factory.create(:grape, :name_en => 'update test')
      put :update, :id => grape.id,  :grape => {:name_cn => nil}
      assert_not_nil assigns(:grape).errors.on(:name_cn)
      assert_template :edit
    end
  end
  
  
end
