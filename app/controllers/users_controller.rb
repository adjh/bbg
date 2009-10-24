class UsersController < ApplicationController
  
  before_filter :logout_required, :only => [:new, :create]
  before_filter :login_required,  :only => [:show, :edit, :update, :avatar, :password]
  before_filter :assign_user, :except  => [:new, :create]
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = t("account.create_success")
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    render
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = t("account.update_success")
      redirect_to account_url
    else
      render :action => :show
    end
  end
  
  def avatar
    if request.post? 
      if @user.update_attributes(params[:user])
        flash[:notice] = t("account.update_avatar_success") unless params[:user].blank?
        redirect_to upload_avatar_url and return
      else
        flash[:error] = t("account.update_avatar_failure")
      end
    end
  end
  
  def password
    if request.post?
      if @user.valid_password?(params[:old_password]) && !params[:user].blank? && @user.update_attributes(params[:user])
        unless params[:user][:password].blank?
          flash[:notice] = t("account.password_update_success")
        else
          flash[:warning] = t("account.change_password_require") 
        end
        redirect_to change_password_url and return
      else
        flash[:error] = t("account.password_not_match")
      end
    end
  end
  
  private
  
  def assign_user
    @user = current_user
  end
  
end
