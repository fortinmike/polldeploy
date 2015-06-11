require "polldeploy/model/deployment"
require "polldeploy/model/config"

module PollDeploy
  class Dsl
    def initialize
      @sources = []
      @deployments = []
    end

    def source(id, source_class, &build)
      source = source_class.new(id)
      build.call(source)
      @sources.push(source)
    end

    def deploy_from(source_id, options, &deploy)
      deployment = PollDeploy::Deployment.new(source_id, options, deploy)
      @deployments.push(deployment)
    end

    def config
      Config.new(@sources, @deployments)
    end
  end
end