require "win32/service"
include Win32

module PollDeploy
  class ServiceManager
    SERVICE_NAME = "polldeploy"

    def self.service_exists?
      Service.exists?(SERVICE_NAME)
    end

    def self.service_running?
      service_state == "running"
    end
    
    def self.create_service
      executable = Utils.path_in_gem("bin/daemon")
      binary_path_name = "\"#{`where ruby`.chomp}\" -C \"#{File.expand_path('~')}\" \"#{executable}\""

      Service.create({
        service_name: SERVICE_NAME,
        host: nil,
        service_type: Service::WIN32_OWN_PROCESS,
        description: "polldeploy",
        start_type: Service::AUTO_START,
        error_control: Service::ERROR_NORMAL,
        binary_path_name: binary_path_name,
        load_order_group: "Network",
        dependencies: nil,
        display_name: "polldeploy"
      })
    end

    def self.delete_service
      Service.delete(SERVICE_NAME)
    end

    def self.start_service
      Service.start(SERVICE_NAME)
    end

    def self.stop_service
      Service.stop(SERVICE_NAME)
    end

    def self.service_state
      Service.status(SERVICE_NAME).current_state
    end
  end
end
