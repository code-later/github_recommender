class UsersCollection
  include Guacamole::Collection
  
  map do
    attribute :repositories, via: Like
  end

  class << self
    def create_or_update(user)
      user = begin
               by_aql("FILTER username == @username", username: user.username).first
             rescue Ashikawa::Core::ResourceNotFound
               save(user) 
             end
    end
  end
end
