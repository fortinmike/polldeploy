require "polldeploy/info"
require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/logic/deployments"

module PollDeploy
  class InfoCommand < Command
    self.command = "info"
    self.summary = "Print information about the current deployment configuration."

    def run
      Console.log_step("The following deployments are configured:")
      Deployments.build(PollDeploy::CONFIG_FILE_PATH).each { |d| Console.log_info(d.to_s) }
    end
  end
end
