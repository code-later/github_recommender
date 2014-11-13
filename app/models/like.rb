class Like
  include Guacamole::Edge

  from :users
  to   :repositories
end
