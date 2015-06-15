require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/logic/builder"

module PollDeploy
  class InfoCommand < Command
    self.command = "info"
    self.summary = "Print information about the current deployment configuration."

    def run
      config = Builder.build(config_file)

      Console.log_substep("Sources:")
      config.sources.each { |s| Console.log_info(s.to_s) } 

      Console.log_substep("Deployments:")
      config.deployments.each { |d| Console.log_info(d.to_s) }
    end
  end
end
