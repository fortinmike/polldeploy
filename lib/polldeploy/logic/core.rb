require "polldeploy/info"
require "polldeploy/service/service_log"
require "polldeploy/logic/builder"
require "polldeploy/model/deploy/deployment"
require "polldeploy/logic/dsl/deploy_dsl"

module PollDeploy
  class Core
    def self.poll
      begin
        config = Builder.build(PollDeploy::CONFIG_FILE)
      rescue => e
        ServiceLog.log_error("Malformed config file:")
        ServiceLog.log_error(e.message)
        e.backtrace.each { |c| ServiceLog.log_error("  #{c}") }
        return
      end

      begin
        perform_deployments(config)
      rescue => e
        ServiceLog.log_error("Error performing deployments:")
        ServiceLog.log_error(e.message)
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
      artifacts = source.fetch_artifacts(config_deployment.options)
      deployment = Deployment.new(config_deployment.name, source, artifacts)

      deploy_dsl = DeployDsl.new(deployment)
      deploy_dsl.instance_exec(deployment, &config_deployment.deploy)
    end
  end
end
