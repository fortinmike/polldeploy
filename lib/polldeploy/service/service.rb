require "polldeploy/info"
require "polldeploy/logic/builder"
require "polldeploy/service/service_log"

module PollDeploy
  class Service
    def self.poll
      config = Builder.build(PollDeploy::CONFIG_FILE)
      ServiceLog.log_info("Performing #{config.deployments.count} deployment(s) from #{config.sources.count} source(s)")
      ServiceLog.log_info("Loaded config:")
      ServiceLog.log_info(config.inspect)
    end
  end
end