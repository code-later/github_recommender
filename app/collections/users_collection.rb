class UsersCollection
  include Guacamole::Collection
  
  map do
    attribute :repositories, via: Like
  end

  class << self
    def find_or_create_by(omniauth_hash)
      begin
        by_aql("FILTER display_name == @display_name", display_name: omniauth_hash["info"]["nickname"]).first
      rescue Ashikawa::Core::ResourceNotFound
        new_user = User.new(github_uid: omniauth_hash["uid"],
                            github_token: omniauth_hash["credentials"]["token"],
                            display_name: omniauth_hash["info"]["nickname"],
                            name: omniauth_hash["info"]["name"],
                            avatar_url: omniauth_hash["info"]["image"])

        save(new_user)
      end
    end

    def create_or_update(user, first = true)
      if first
        user.github_user.rels[:following].get.data.each do |u|
          create_or_update(User.new(username: u.login), false)
        end
      end
    end
  end
end
