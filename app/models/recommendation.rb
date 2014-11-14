class Recommendation
  include ActiveModel::Conversion

  class << self
    def recommendations_for(user)
      user.repositories.map { |repo| new(1, repo) }
    end
  end

  attr_reader :repo, :rank

  def initialize(rank, repo)
    @rank = rank
    @repo = repo
  end
end
