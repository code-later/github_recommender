class GithubImporter
  attr_reader :client

  def initialize(user)
    @user   = user
    @client = Octokit::Client.new(access_token:  user.github_token,
                                  per_page:      100,
                                  auto_paginate: true)
  end

  def import_followings(use_cached = true)
    return true if use_cached

    followings = client.following.map do |following|
      u = UsersCollection.find_or_create_by_attributes(following)
      import_repositories(u, u.fresh?)
      u
    end

    @user.followings = followings

    import_repositories(@user, @user.fresh?)
  end

  def import_repositories(user = @user, use_cached = true)
    return true if use_cached

    user.repositories = client.repos(user.login).map do |repo|
      RepositoriesCollection.find_or_initialize_by_attributes(repo)
    end
    UsersCollection.save user
  end
end
