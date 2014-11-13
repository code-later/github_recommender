class RepositoriesCollection
  include Guacamole::Collection

  map do
    attribute :users, via: Like
    attribute :owner, via: Ownership
  end
end
