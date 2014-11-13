class User
  include Guacamole::Model

  attribute :username, String
  attribute :gravatar_url, String
  attribute :repositories, Array[Repository]

  validate :username, presence: true
end
