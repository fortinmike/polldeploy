require "uri"
require "teamcity"
require "polldeploy/polldeploy_exception"
require "polldeploy/service/service_log"
require "polldeploy/model/deploy/artifact"

module PollDeploy
  class TeamCitySource
    def initialize(config_source)
      @config_source = config_source
    end

    def configure_teamcity_client
      TeamCity.reset
      TeamCity.configure do |config|
        config.endpoint = URI.join(@config_source.url, "httpAuth/app/rest/8.0")
        config.http_user = @config_source.username
        config.http_password = @config_source.password
      end
    end

    def fetch_artifacts(options)
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
      raise PollDeployException, "Could not fetch artifacts from source '#{@config_source.id}':\n#{e.message}"
    end

    def download(artifact)
      ServiceLog.log_info("Downloading artifact #{artifact.name} to local file #{artifact.file}")
      return artifact.file
    end
  end
end
