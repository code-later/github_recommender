class GithubImportWorker
  include Sidekiq::Worker

  def perform(type, user_key)
    user = UsersCollection.by_key(user_key)

    importer = GithubImporter.new(user)
    importer.send("import_#{type}")
  end
end
