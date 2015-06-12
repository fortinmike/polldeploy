module PollDeploy
  class Config
    DEFAULT_POLLING_INTERVAL = 5

    attr_accessor :sources
    attr_accessor :deployments

    def initialize(sources, deployments)
      @sources = sources
      @deployments = deployments
    end
  end
end