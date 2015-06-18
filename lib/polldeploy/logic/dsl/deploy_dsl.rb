require "polldeploy/service/service_log"
require "polldeploy/model/deploy/deployment"

module PollDeploy
  class DeployDsl < BasicObject
    def initialize(deployment)
      @deployment = deployment
    end

    def download(artifact)
      #log "#{a}"
      #return @deployment.source.download(artifact)
    end

    def log(message)
      #ServiceLog.log_info(message)
    end
  end
end