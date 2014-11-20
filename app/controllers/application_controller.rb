class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    return @_current_user if @_current_user
    
    if session[:current_user_key]
      @_current_user = UsersCollection.by_key(session[:current_user_key])
    end
  end

  def current_user=(user)
    session[:current_user_key] = user.key if user
    @_current_user = user
  end
  helper_method :current_user

  private

  def require_login
    unless current_user
      redirect_to new_user_path
    end
  end
end
