require "polldeploy/logic/deployment"
require "polldeploy/sources/sources"
require "polldeploy/dsl"

module PollDeploy
  class Deployments
    DEPLOYMENTS = []

    def self.build(config_file)
      DEPLOYMENTS.clear
      require File.expand_path(config_file)
      return DEPLOYMENTS
    end
  end
end