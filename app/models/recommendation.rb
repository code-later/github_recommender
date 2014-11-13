class Recommendation
  class << self
    def recommend_repos_for(user)
      user.repositories
    end
  end
end
