class UserCallbacks
  include Guacamole::Callbacks

  # after_create :load_repos_from_github

  def load_repos_from_github
    object.repositories = object.github_user.rels[:repos].get.data.map do |repo| 
      Repository.new({
                       name: repo.name,
                       full_name: repo.full_name,
                       url: repo.url,
                       created: repo.created_at,
                       language: repo.language,
                       watchers: repo.watchers,
                       stargazers: repo.stargazers_count,
                       forks: repo.forks
                     })
    end

    UsersCollection.save object
  end
end
