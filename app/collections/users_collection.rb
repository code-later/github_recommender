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

      if user.changed_attributes?
        save(user)
      end

      user
    end

    def find_or_create_by_attributes(attributes)
      user = by_aql("FILTER user.login == @login", login: attributes[:login]).first

      return user if user.present?

      new_user = User.new(attributes)

      save(new_user)
    end
  end
end
