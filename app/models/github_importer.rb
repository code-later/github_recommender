class GithubImporter
  attr_reader :client

  def initialize(user)
    @user   = user
    @client = Octokit::Client.new(access_token:  user.github_token,
                                  per_page:      100,
                                  auto_paginate: true)
  end

  def import_followings
    client.following.each do |following|
      u = UsersCollection.find_or_create_by_attributes(following)
      import_repositories(u)
    end
  end

  def import_repositories(user = @user)
    user.repositories = client.repos(user.login).map do |repo|
      Repository.new(name: repo.name,
                     full_name: repo.full_name,
                     url: repo.url,
                     created: repo.created_at,
                     language: repo.language,
                     watchers: repo.watchers,
                     stargazers: repo.stargazers_count,
                     forks: repo.forks)
    end
    UsersCollection.save user
  end
end
