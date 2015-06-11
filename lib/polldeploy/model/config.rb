module PollDeploy
  class Config
    attr_accessor :sources
    attr_accessor :deployments

    def initialize(sources, deployments)
      @sources = sources
      @deployments = deployments
    end
  end
end