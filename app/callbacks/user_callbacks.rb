class UserCallbacks
  include Guacamole::Callbacks

  after_save :import_followings

  def import_followings
    if object.github_token.present? && object.needs_reimport?
      object.github_importer.import_followings
    end
  end
end
