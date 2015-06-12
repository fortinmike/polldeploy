require "fileutils"

require "polldeploy/commands/command"
require "polldeploy/utility/utils"
require "polldeploy/utility/console"

module PollDeploy
  class InitCommand < Command
    self.command = "init"
    self.summary = "Initialize polldeploy on this machine."

    def run
      Console.log_step("Initializing...")

      if File.exist?(PollDeploy::CONFIG_FILE_PATH)
        Console.log_warning("Already initialized! To reinitialize, please delete the current config file.")
      else
        Console.log_substep("Copying config template to user home directory")
        copy_config_template_to_user_home
      end
      
      Console.log_substep("Creating and starting service...")
      ServiceManager.create_service unless ServiceManager.service_exists?
      ServiceManager.start_service

      Console.log_step("Initialized polldeploy!")
      Console.log_info("Edit '#{PollDeploy::CONFIG_FILE_PATH}' to configure automatic deployments")
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
