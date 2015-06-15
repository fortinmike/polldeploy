require "uri"
require "teamcity"
require "polldeploy/service/service_log"

module PollDeploy
  class TeamCitySource
    attr_accessor :id
    
    attr_accessor :url
    attr_accessor :username
    attr_accessor :password

    def initialize(id)
      @id = id
    end

    def fetch(options)
      configure_teamcity_client
      project = TeamCity.project(id: options[:project_id])
      return project
    rescue Exception => e
      ServiceLog.log_error("Could not fetch source '#{@id}':\n#{e.message}")
    end

    def configure_teamcity_client
      TeamCity.configure do |config|
        config.endpoint = URI.join(@url, "httpAuth/app/rest")
        config.http_user = @username
        config.http_password = @password
      end
    end

    def to_s
      "TeamCity '#{@url}' ('#{@username}' / '#{@password}')"
    end
  end
end
