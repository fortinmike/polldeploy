require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/service/service_manager"

module PollDeploy
  class StopCommand < Command
    self.command = "stop"
    self.summary = "Stop the polldeploy service."

    def run
      Console.log_step("Stopping the polldeploy service...")
      stop_service_step
      Console.log_step("Done!")
    end

    def stop_service_step
      begin
        ServiceManager.stop_service
      rescue SystemCallError => e
        Console.log_error(e.message)
      end
    end
  end
end
