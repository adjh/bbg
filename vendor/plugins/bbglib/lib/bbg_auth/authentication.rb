# BBGlib
# create by Raecoo
# based on AuthLogic

module BbgAuth

  module  Authentication

    protected

    def logged_in?
      !!current_user
    end

    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.record
    end

    def login_required
      unless current_user
        store_location
        flash[:warning] = t("f.require_login")
        redirect_to login_url
        return false
      end
    end

    def logout_required
      if current_user
        store_location
        flash[:notice] = t("f.require_logout")
        redirect_to account_url
        return false
      end
    end

    def login_then_link_to(name, options = {}, html = {})
      link_to_unless(!current_user, name, options, html) do |name|
        link_to(name, login_url(:to => options))
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

  end

end

