class User
  include Guacamole::Model

  ONE_WEEK = 1

  attr_accessor :current_import_job

  attribute :github_uid, String
  attribute :github_token, String
  attribute :name, String
  attribute :login, String
  attribute :avatar_url, String
  attribute :last_import, DateTime
  attribute :repositories, Array[Repository], coerce: false
  attribute :followings, Array[User], coerce: false

  validate :login, presence: true
  validate :github_uid, presence: true

  callbacks :user_callbacks

  def fresh?
    updated_at.present? && updated_at > Time.now.weeks_ago(ONE_WEEK)
  end

  def needs_reimport?
    last_import.nil? || last_import_more_then_7_day_ago?
  end

  def last_import_more_then_7_day_ago?
    last_import.present? && last_import < Time.now.weeks_ago(ONE_WEEK)
  end
end
