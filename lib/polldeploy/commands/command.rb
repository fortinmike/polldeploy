require "claide"

require "polldeploy/info"
require "polldeploy/service/service_manager"

module PollDeploy
  class Command < CLAide::Command
    self.abstract_command = true
    self.command = "polldeploy"
    self.version = PollDeploy::VERSION
    self.description = PollDeploy::DESCRIPTION

    def create_service
      begin
        if ServiceManager.service_exists?
          Console.log_info("Service already exists, no need to create")
          return
        end

        Console.log_substep("Creating service...")
        ServiceManager.create_service
      rescue SystemCallError => e
        Console.log_error(e.message)
      end
    end

    def delete_service
      begin
        unless ServiceManager.service_exists?
          Console.log_info("Service does not exist, no need to delete")
          return
        end

        Console.log_substep("Deleting service...")
        ServiceManager.delete_service
      rescue SystemCallError => e
        Console.log_error(e.message)
      end
    end

    def start_service
      begin
        if ServiceManager.service_running?
          Console.log_info("Service is already running")
          return
        end

        Console.log_substep("Starting service...")
        ServiceManager.start_service
      rescue SystemCallError => e
        Console.log_warning(e.message)
      end
    end

    def stop_service
      begin
        unless ServiceManager.service_exists?
          Console.log_info("Service does not exist, no need to stop")
          return
        end

        unless ServiceManager.service_running?
          Console.log_info("Service is not running, no need to stop")
          return
        end
        
        Console.log_substep("Stopping service...")
        ServiceManager.stop_service
      rescue SystemCallError => e
        Console.log_error(e.message)
      end
    end
  end
end
