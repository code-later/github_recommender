class UserCallbacks
  include Guacamole::Callbacks

  # Add your callbacks
  # before_create :encrypt_password

  # def encrypt_password
  #   object.encrypted_password = BCrypt::Password.create(object.password)
  # end
end

