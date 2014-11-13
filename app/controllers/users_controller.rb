class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]

    if @user.valid?
      UsersCollection.save @user

      redirect_to user_recommendations(@user)
    else
      render :new
    end
    
  end
end
