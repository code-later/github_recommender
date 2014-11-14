class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.valid?
      UsersCollection.create_or_update @user

      redirect_to user_recommendations_url(@user)
    else
      render :new
    end
  end
end
