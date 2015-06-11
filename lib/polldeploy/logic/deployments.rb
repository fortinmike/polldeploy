require "polldeploy/sources/sources"
require "polldeploy/dsl"

module PollDeploy
  class Deployments
    def self.rebuild(config_file)
      require File.expand_path(config_file)
    end
  end
end