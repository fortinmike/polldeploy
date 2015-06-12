module PollDeploy
  class Config
    DEFAULT_POLLING_INTERVAL = 5

    attr_accessor :sources
    attr_accessor :deployments

    def initialize(sources, deployments)
      @sources = sources
      @deployments = deployments
    end

    def to_s
      description = []
      description << "Sources:"
      config.sources.each { |s| description << s.to_s } 
      description << "Deployments:"
      config.deployments.each { |d| description << d.to_s }
      return description.join("\n")
    end
  end
end