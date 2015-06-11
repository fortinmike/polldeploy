require "polldeploy/info"
require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/logic/deployments"

module PollDeploy
  class InfoCommand < Command
    self.command = "info"
    self.summary = "Print information about the current deployment configuration."

    def run
      puts Deployments.rebuild(PollDeploy::CONFIG_FILE_PATH)
    end
  end
end
