module PollDeploy
  class ServiceLog
    LOG_FILE = "polldeploy-log.txt"
    CRITICAL_LOG_FILE = "polldeploy-error.txt"

    def self.log_info(message)
      log("INFO", message)
    end

    def self.log_warning(message)
      log("WARNING", message)
    end

    def self.log_error(message)
      log("ERROR", message)
    end

    def self.log_critical_error(message)
      File.open(CRITICAL_LOG_FILE, "a") { |f| f.puts "#{Time.now}: #{message}" }
    end

    def self.log(level_name, message)
      File.open(LOG_FILE, "a") { |f| f.puts "#{Time.now}: [#{level_name}] #{message}" }
    end
  end
end
