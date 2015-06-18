module PollDeploy
  class Deployment
    attr_accessor :name
    attr_accessor :source
    attr_accessor :artifacts

    def initialize(name, source, artifacts)
      @name = name
      @source = source
      @artifacts = artifacts
    end
  end
end
