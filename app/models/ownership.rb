class Ownership
  include Guacamole::Edge

  from :users
  to   :repositories
end
