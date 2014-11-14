class User
  include Guacamole::Model

  attribute :username, String
  attribute :avatar_url, String
  attribute :repositories, Array[Repository]

  validate :username, presence: true

  callbacks :user_callbacks

  def github_user
    @github_user ||= Octokit.user username
  end
end
