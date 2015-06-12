require "polldeploy/commands/command"
require "polldeploy/utility/console"

module PollDeploy
  class StopCommand < Command
    self.command = "stop"
    self.summary = "Stop the polldeploy service."

    def run
      Console.log_step("Stopping the polldeploy service...")
      stop_service
      Console.log_step("Done!")
    end
  end
end
