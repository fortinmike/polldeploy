require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/service/service_manager"

module PollDeploy
  class StartCommand < Command
    self.command = "start"
    self.summary = "Start the polldeploy service."

    def run
      Console.log_step("Starting the polldeploy service...")
      start_service_step
      Console.log_step("Done!")
    end

    def start_service_step
      begin
        ServiceManager.start_service
      rescue SystemCallError => e
        Console.log_error(e.message)
      end
    end
  end
end