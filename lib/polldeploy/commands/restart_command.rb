require "polldeploy/commands/command"
require "polldeploy/utility/console"

module PollDeploy
  class RestartCommand < Command
    self.command = "restart"
    self.summary = "Restart the polldeploy service."

    def run
      Console.log_step("Restarting the polldeploy service...")
      stop_service
      start_service
      Console.log_step("Done!")
    end
  end
end
