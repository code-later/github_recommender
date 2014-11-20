class SessionsController < ApplicationController
  def create
    user = UsersCollection.update_user(auth_hash)

    if user
      self.current_user = user
      GithubImporter.new(current_user).import_followings

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
    auth_hash = request.env['omniauth.auth']

    {
      id:           auth_hash["uid"],
      github_token: auth_hash["credentials"]["token"],
      login:        auth_hash["info"]["nickname"],
      name:         auth_hash["info"]["name"],
      avatar_url:   auth_hash["info"]["image"]
    }
  end
end
