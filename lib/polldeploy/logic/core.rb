require "polldeploy/info"
require "polldeploy/logic/builder"
require "polldeploy/service/service_log"

module PollDeploy
  class Core
    def self.poll
      config = Builder.build(PollDeploy::CONFIG_FILE)
      ServiceLog.log_info("Performing #{config.deployments.count} deployment(s) from #{config.sources.count} source(s)")

      perform_deployments(config)
    end

    def self.perform_deployments(config)
      config.deployments.each do |deployment|
        ServiceLog.log_info("Performing deployment #{deployment.name}")
        source = config.sources.find { |s| s.id == deployment.source_id }
        unless source
          ServiceLog.log_error("No source named '#{deployment.source_id}' exists")
          ServiceLog.log_error("Deployment aborted")
          next
        end
        perform_deployment(source, deployment)
      end
    end

    def self.perform_deployment(source, deployment)
    end
  end
end
