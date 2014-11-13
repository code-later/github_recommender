class UsersCollection
  include Guacamole::Collection
  
  map do
    attribute :repositories, via: Like
  end
end
