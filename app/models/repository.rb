class Repository
  include Guacamole::Model

  attribute :user, User, coerce: false

  attribute :name, String
  attribute :full_name, String
  attribute :url, String
  attribute :created, DateTime
  attribute :language, String
  attribute :watchers, Fixnum
  attribute :stargazers, Fixnum
  attribute :forks, Fixnum
  attribute :rank, Fixnum
end
