module PollDeploy
	class ConfigSource
    attr_accessor :id
    attr_accessor :type
    attr_accessor :url
    attr_accessor :username
    attr_accessor :password

    def to_s
      "#{@type} '#{@url}' ('#{@username}' / '#{@password}')"
    end
  end
end