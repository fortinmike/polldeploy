require "fileutils"

require "polldeploy/commands/command"
require "polldeploy/utility/utils"
require "polldeploy/utility/console"
require "polldeploy/service/service_manager"

module PollDeploy
  class InitCommand < Command
    self.command = "init"
    self.summary = "Initialize polldeploy on this machine."

    def self.options
      [['--force', 'Force initialize, replacing the config file if it exists']].concat(super)
    end
    
    def initialize(argv)
      @force = argv.flag?("force")
      super
    end

    def run
      Console.log_step("Initializing...")

      if !File.exist?(PollDeploy::CONFIG_FILE_PATH) || @force
        Console.log_substep("Copying config template to user home directory")
        copy_config_template_to_user_home
      else
        Console.log_warning("Config file already exists! To start from scratch, delete the current config file.")
      end

      Console.log_substep("Creating and starting service...")
      ServiceManager.create_service unless ServiceManager.service_exists?
      begin
        ServiceManager.start_service
      rescue SystemCallError => e
        Console.log_warning(e.message)
      end

      Console.log_step("Initialized polldeploy!")
      Console.log_info("Edit '#{PollDeploy::CONFIG_FILE_PATH}' to configure automatic deployments")
    end

    def copy_config_template_to_user_home
      template_file = Utils.path_in_gem("resources/polldeploy-config.rb")
      FileUtils.cp_r(template_file, PollDeploy::CONFIG_FILE_PATH, { :remove_destination => true })
    end

    def open_config_file
      Utils.open_in_default_app(PollDeploy::CONFIG_FILE_PATH)
    end
  end
end
