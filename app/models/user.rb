class User
  include Guacamole::Model

  attribute :github_uid, String
  attribute :github_token, String
  attribute :name, String
  attribute :display_name, String
  attribute :avatar_url, String
  attribute :repositories, Array[Repository]

  validate :display_name, presence: true
  validate :github_uid, presence: true
  validate :github_token, presence: true

  callbacks :user_callbacks

  def github_user
    @github_user ||= Octokit.user username
  end
end
