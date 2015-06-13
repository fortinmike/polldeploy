module PollDeploy
  class Deployment
    attr_accessor :name
    attr_accessor :source_id
    attr_accessor :options
    attr_accessor :deploy

    def initialize(name, source_id, options, deploy)
      @name = name
      @source_id = source_id
      @options = options
      @deploy = deploy
    end

    def to_s
      description = []
      description << "#{@name} deployment:"
      description << "- Source: #{@source_id}"
      description << "- Options: #{@options}"
      return description.join("\n")
    end
  end
end
