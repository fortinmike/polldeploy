require "polldeploy/info"
require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/logic/builder"

module PollDeploy
  class InfoCommand < Command
    self.command = "info"
    self.summary = "Print information about the current deployment configuration."

    def run
      config = Builder.build(config_file)
      Console.log_info(config.to_s)
    end
  end
end
