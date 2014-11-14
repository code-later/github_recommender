class GithubImporter
  attr_reader :client

  def initialize(user)
    @user   = user
    @client = Octokit::Client.new(access_token:  user.github_token,
                                  per_page:      100,
                                  auto_paginate: true)
  end

  def import_user(user)
  end

  def import_repositories(user)
  end
end
