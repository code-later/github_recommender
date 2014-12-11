class RepositoriesCollection
  include Guacamole::Collection

  map do
    attribute :user, via: Like, inverse: true
  end

  class << self
    def find_or_initialize_by_attributes(attributes)
      by_aql("FILTER repository.full_name == @full_name", full_name: attributes[:full_name]).first ||
        Repository.new(name: attributes[:name],
                       full_name: attributes[:full_name],
                       url: attributes[:url],
                       created: attributes[:created_at],
                       language: attributes[:language],
                       watchers: attributes[:watchers],
                       stargazers: attributes[:stargazers_count],
                       forks: attributes[:forks])
    end
  end
end
