class UsersCollection
  include Guacamole::Collection
  
  map do
    attribute :repositories, via: Like
    attribute :followings, via: Followship
  end

  class << self
    def update_user(attributes)
      user = find_or_create_by_attributes(attributes)

      user.attributes = user.attributes.merge(attributes)

      save(user) unless user.fresh?

      user
    end

    def find_or_create_by_attributes(attributes)
      user = by_aql("FILTER user.login == @login", login: attributes[:login]).first
      return user if user.present?

      new_user = User.new(github_uid: attributes[:id],
                          login:      attributes[:login],
                          avatar_url: attributes[:avatar_url])

      save(new_user)
    end
  end
end
