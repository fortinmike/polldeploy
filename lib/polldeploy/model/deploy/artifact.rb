module PollDeploy
  class Artifact
    attr_accessor :name
    attr_accessor :url

    def initialize(name, url)
      @name = name
      @url = url
    end
  end
end
