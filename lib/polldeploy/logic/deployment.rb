module PollDeploy
  class Deployment
    def initialize(source, options, operation)
      @source = source
      @options = options
      @operation = operation
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