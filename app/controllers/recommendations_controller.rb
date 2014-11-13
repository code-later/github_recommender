class RecommendationsController < ApplicationController
  before_filter :load_user

  def index
    @recommendations = Recommendation.recommend_repos_for(@user)
  end

  private

  def load_user
    @user = UsersCollection.by_key params[:user_id]
  end
end
