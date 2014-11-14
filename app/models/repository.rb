class Repository
  include Guacamole::Model

  # attribute :users, Array[User]

  attribute :name, String
  attribute :full_name, String
  attribute :url, String
  attribute :created, DateTime
  attribute :language, String
  attribute :watchers, Fixnum
  attribute :stargazers, Fixnum
  attribute :forks, Fixnum
end
