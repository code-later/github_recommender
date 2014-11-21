class Recommendation
  include ActiveModel::Conversion

  MIN_RANK           = 110
  DEFAULT_LANGUAGE   = 'Ruby'
  RECOMMENDATION_AQL = <<-AQL.strip_heredoc
    FOR n IN GRAPH_NEIGHBORS(@graph,
                            { _key:@vertex },
                            { direction: 'outbound',
                              maxDepth: 2,
                              minDepth: 2, vertexCollectionRestriction: 'repositories'
                            })
        LET rank = (2*n.vertex.stargazers + n.vertex.watchers + 4*n.vertex.forks)
        FILTER n.vertex.language == @language &&
               rank >= @min_rank
        SORT rank DESC
        LIMIT 5
        RETURN MERGE(n.vertex, { rank: rank })
  AQL

  class << self
    def recommendations_for(user, language)
      query_for_recommendations(user, language).map do |repo| 
        new(repo)
      end
    end

    def query_for_recommendations(user, language)
      RepositoriesCollection.by_aql(RECOMMENDATION_AQL,
                                    { vertex: user.key, min_rank: MIN_RANK, language: language || DEFAULT_LANGUAGE, graph: Guacamole.configuration.graph.name },
                                    { return_as: nil, for_in: nil })
    end
  end

  attr_reader :repo

  def initialize(repo)
    @repo = repo
  end

  def rank
    repo.rank || 0
  end
end
