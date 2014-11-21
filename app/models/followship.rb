class Followship
  include Guacamole::Edge

  from :users
  to   :users
end
