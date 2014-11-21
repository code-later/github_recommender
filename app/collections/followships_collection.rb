class FollowshipsCollection
  include Guacamole::EdgeCollection

  class << self
    def mapper_for_target(model)
      vertex_mapper.first
    end

    def mapper_for_start(model)
      vertex_mapper.first
    end
  end 
end
