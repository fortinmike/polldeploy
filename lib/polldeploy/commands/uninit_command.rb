require "polldeploy/commands/command"
require "polldeploy/utility/console"

module PollDeploy
  class UninitCommand < Command
    self.command = "uninit"
    self.summary = "Remove the polldeploy service from this machine, keeping the config file."

    def run
      Console.log_step("Uninitializing...")
      stop_service
      delete_service
      Console.log_step("Done!")
    end

    def copy_config_template_to_user_home
      template_file = Utils.path_in_gem("resources/polldeploy-config.rb")
      FileUtils.cp(template_file, config_file)
    end
  end
end
