class SessionsController < ApplicationController
  def create
    if user = UsersCollection.update_user(auth_hash)
      self.current_user = user

      redirect_to import_job_path(user.current_import_job)
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
    auth_hash = request.env['omniauth.auth']

    {
      github_uid:   auth_hash["uid"],
      github_token: auth_hash["credentials"]["token"],
      login:        auth_hash["info"]["nickname"],
      name:         auth_hash["info"]["name"],
      avatar_url:   auth_hash["info"]["image"]
    }
  end
end
