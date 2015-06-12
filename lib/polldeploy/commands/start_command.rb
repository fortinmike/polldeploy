require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/service/service_manager"

module PollDeploy
  class StartCommand < Command
    self.command = "start"
    self.summary = "Start the polldeploy service."

    def run
      Console.log_step("Starting the polldeploy service...")
      ServiceManager.start_service
      Console.log_step("Done!")
    end
  end
end