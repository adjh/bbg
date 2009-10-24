class UserSessionsController < ApplicationController
  
  before_filter :logout_required, :only => [:new, :create]
  before_filter :login_required,  :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t("account.login_success")
      if params[:to].blank?
        redirect_back_or_default account_url
      else
        redirect_to params[:to] and return
      end
    else
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = t("account.logout_success")
    redirect_back_or_default login_url
  end
end
