require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/service/service_manager"

module PollDeploy
  class StopCommand < Command
    self.command = "stop"
    self.summary = "Stop the polldeploy service."

    def run
      Console.log_step("Stopping the polldeploy service...")
      ServiceManager.stop_service
      Console.log_step("Done!")
    end
  end
end
