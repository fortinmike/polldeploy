require "polldeploy/model/deployment"
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

    def source(id, source_class, &build)
      source = source_class.new(id)
      build.call(source)
      @sources.push(source)
    end

    def deploy(name, source_id, options, &deploy)
      deployment = Deployment.new(name, source_id, options, deploy)
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
