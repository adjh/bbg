class PasswordResetsController < ApplicationController  
  
  before_filter :logout_required
  before_filter :load_user_using_perishable_token, :only => [:edit, :update]

  def new  
    render  
  end  

  def create  
    @user = User.find_by_email(params[:email])  
    if @user  
      @user.deliver_password_reset_instructions!  
      flash[:notice] = t("account.reset_password_intro")
      redirect_to login_url  
    else  
      flash[:error] = t("account.not_found_by_email") 
      render :action => :new  
    end  
  end  

  def edit
    render
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = t("account.password_update_success") 
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  private
  
  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:error] = t("account.reset_password_found_failure")
      redirect_to login_url
    end
  end

end