module PollDeploy
  class Deployment
    attr_accessor :source
    attr_accessor :options
    attr_accessor :deploy

    def initialize(source, options, deploy)
      @source = source
      @options = options
      @deploy = deploy
    end

    def to_s
      description = []
      description << "Deployment:"
      description << "- Source: #{@source}"
      description << "- Options: #{@options}"
      return description.join("\n")
    end
  end
end
