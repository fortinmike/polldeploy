require "polldeploy/info"
require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/logic/builder"

module PollDeploy
  class InfoCommand < Command
    self.command = "info"
    self.summary = "Print information about the current deployment configuration."

    def run
      Console.log_step("The following deployments are configured:")
      config = Builder.build(PollDeploy::CONFIG_FILE_PATH)
      puts config.inspect
    end
  end
end
