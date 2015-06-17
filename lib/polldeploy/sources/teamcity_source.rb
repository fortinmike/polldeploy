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

      # Further restrict fetch results
      options[:branch] = "refs/heads/" + options[:branch] if options[:branch]
      options[:status] = "SUCCESS"
      options[:count] = 1

      # Find the latest successful build
      latest_build = TeamCity.builds(options).first
      raise "No build found for build locator #{options}" unless latest_build.first

      artifacts = TeamCity.build_artifacts(latest_build.id)

      return artifacts
    rescue Exception => e
      ServiceLog.log_error("Could not fetch source '#{@id}':\n#{e.message}")
    end

    def configure_teamcity_client
      TeamCity.reset
      TeamCity.configure do |config|
        config.endpoint = URI.join(@url, "httpAuth/app/rest/8.0")
        config.http_user = @username
        config.http_password = @password
      end
    end

    def to_s
      "TeamCity '#{@url}' ('#{@username}' / '#{@password}')"
    end
  end
end
