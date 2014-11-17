class SessionsController < ApplicationController
  def create
    user = UsersCollection.find_or_create_by(auth_hash)

    if user
      self.current_user = user
      redirect_to root_path, notice: 'You have successfully signed in!'
    else
      redirect_to root_path, notice: 'Something went wrong'
    end
  end

  def destroy
    reset_session

    redirect_to root_path, notice: 'Logged out'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
