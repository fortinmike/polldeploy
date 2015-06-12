require "polldeploy/commands/command"
require "polldeploy/utility/console"
require "polldeploy/service/service_manager"

module PollDeploy
  class UninitCommand < Command
    self.command = "uninit"
    self.summary = "Remove the polldeploy service from this machine, keeping the config file."

    def run
      Console.log_step("Uninitializing...")
      stop_service_step
      delete_service_step
      Console.log_step("Done!")
    end

    def stop_service_step
      begin
        Console.log_substep("Stopping service...")
        ServiceManager.stop_service
      rescue SystemCallError => e
        Console.log_error(e.message)
      end
    end

    def delete_service_step
      begin
        Console.log_substep("Deleting service...")
        ServiceManager.delete_service
      rescue SystemCallError => e
        Console.log_(e.message)
      end
    end

    def copy_config_template_to_user_home
      template_file = Utils.path_in_gem("resources/polldeploy-config.rb")
      FileUtils.cp(template_file, PollDeploy::CONFIG_FILE_PATH)
    end

    def open_config_file
      Utils.open_in_default_app(PollDeploy::CONFIG_FILE_PATH)
    end
  end
end
