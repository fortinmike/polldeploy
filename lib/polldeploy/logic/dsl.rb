require "polldeploy/model/config_deployment"
require "polldeploy/model/config_source"
require "polldeploy/model/config"
require "polldeploy/sources/sources"
require "polldeploy/service/service_log"

module PollDeploy
  class Dsl < BasicObject
    def initialize
      @sources = []
      @deployments = []
    end

    # DSL

    def source(id, type, &build)
      source = ConfigSource.new
      source.id = id
      source.type = type
      build.call(source)
      @sources.push(source)
    end

    def deploy(name, source_id, options, &deploy)
      deployment = ConfigDeployment.new
      deployment.name = name
      deployment.source_id = source_id
      deployment.options = options
      deployment.deploy = deploy
      @deployments.push(deployment)
    end

    def log(message)
      ServiceLog.log_info(message)
    end

    # Obtain DSl usage results

    def config
      Config.new(@sources, @deployments)
    end
  end
end
