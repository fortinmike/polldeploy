require "polldeploy/info"
require "polldeploy/logic/builder"
require "polldeploy/service/service_log"

module PollDeploy
  class Core
    def self.poll
      begin
        config = Builder.build(PollDeploy::CONFIG_FILE)
      rescue => e
        ServiceLog.log_error("Malformed config file:")
        e.backtrace.each { |c| ServiceLog.log_error("  #{c}") }
        return
      end

      perform_deployments(config)
    end

    def self.perform_deployments(config)
      ServiceLog.log_info("Performing #{config.deployments.count} deployment(s) from #{config.sources.count} source(s)")
      config.deployments.each do |deployment|
        ServiceLog.log_info("Performing deployment '#{deployment.name}'")
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
      results = source.fetch(deployment.options)
      ServiceLog.log_info(results)
    end
  end
end
