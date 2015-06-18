require "polldeploy/model/config/config_deployment"
require "polldeploy/model/config/config_source"
require "polldeploy/model/config/config"
require "polldeploy/sources/sources"

module PollDeploy
  class ConfigDsl < BasicObject
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
    
    # Obtain DSl usage results

    def config
      Config.new(@sources, @deployments)
    end
  end
end
