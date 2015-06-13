require "polldeploy/info"
require "polldeploy/logic/builder"
require "polldeploy/service/service_log"

module PollDeploy
  class Core
    def self.poll
      config = Builder.build(PollDeploy::CONFIG_FILE)
      ServiceLog.log_info("Performing #{config.deployments.count} deployment(s) from #{config.sources.count} source(s)")
    end
  end
end
