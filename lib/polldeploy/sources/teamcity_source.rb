require "uri"
require "teamcity"
require "polldeploy/service/service_log"
require "polldeploy/model/deploy/artifact"

module PollDeploy
  class TeamCitySource
    def initialize(config_source)
      @config_source = config_source
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

      teamcity_artifacts = TeamCity.build_artifacts(latest_build.id) || []
      artifacts = teamcity_artifacts.map { |a| Artifact.new(a.name, a["content"].href) }

      return artifacts
    rescue Exception => e
      ServiceLog.log_error("Could not fetch source '#{@config_source.id}':\n#{e.message}")
    end

    def configure_teamcity_client
      TeamCity.reset
      TeamCity.configure do |config|
        config.endpoint = URI.join(@config_source.url, "httpAuth/app/rest/8.0")
        config.http_user = @config_source.username
        config.http_password = @config_source.password
      end
    end
  end
end
