require "fileutils"

require "polldeploy/commands/command"
require "polldeploy/utility/utils"
require "polldeploy/utility/console"

module PollDeploy
  class InitCommand < Command
    self.command = "init"
    self.summary = "Initialize polldeploy on this machine."

    def run
      if File.exist?(PollDeploy::CONFIG_FILE_PATH)
        Console.log_warning("Already initialized! Please remove the current config file to start from scratch.")
        return
      end
      
      copy_config_template_to_user_home

      Console.log_step("Initialized polldeploy!")
      Console.log_info("Edit '#{PollDeploy::CONFIG_FILE_PATH}' to configure automatic deployments")
    end

    def copy_config_template_to_user_home
      template_file = Utils.path_for_resource("polldeploy-config.rb")
      FileUtils.cp(template_file, PollDeploy::CONFIG_FILE_PATH)
    end

    def open_config_file
      Utils.open_in_default_app(PollDeploy::CONFIG_FILE_PATH)
    end
  end
end
