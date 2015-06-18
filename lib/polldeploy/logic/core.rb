require "polldeploy/info"
require "polldeploy/service/service_log"
require "polldeploy/logic/builder"
require "polldeploy/model/deploy/deployment"

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

      begin
        perform_deployments(config)
      rescue => e
        ServiceLog.log_error("Error performing deployments:")
        e.backtrace.each { |c| ServiceLog.log_error("  #{c}") }
      end
    end

    def self.perform_deployments(config)
      ServiceLog.log_info("Performing #{config.deployments.count} deployment(s) from #{config.sources.count} source(s)")
      config.deployments.each do |config_deployment|
        ServiceLog.log_info("Performing deployment '#{config_deployment.name}'")
        config_source = config.sources.find { |s| s.id == config_deployment.source_id }
        unless config_source
          ServiceLog.log_error("No source named '#{config_deployment.source_id}' exists")
          ServiceLog.log_error("Deployment aborted")
          next
        end
        perform_deployment(config_source, config_deployment)
      end
    end

    def self.perform_deployment(config_source, config_deployment)
      source = config_source.type.new(config_source)
      artifacts = source.fetch(config_deployment.options)
      deployment = Deployment.new(config_deployment.name, artifacts)
      config_deployment.deploy.call(deployment)
    end
  end
end
