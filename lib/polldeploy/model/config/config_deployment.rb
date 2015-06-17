module PollDeploy
  class ConfigDeployment
    attr_accessor :name
    attr_accessor :source_id
    attr_accessor :options
    attr_accessor :deploy
    
    def to_s
      description = []
      description << "#{@name} deployment:"
      description << "- Source: #{@source_id}"
      description << "- Options: #{@options}"
      return description.join("\n")
    end
  end
end
