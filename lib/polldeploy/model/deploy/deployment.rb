module PollDeploy
  class Deployment
    attr_accessor :name
    attr_accessor :artifacts

    def initialize(name, artifacts)
      @name = name
      @artifacts = artifacts
    end
  end
end
