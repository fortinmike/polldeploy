require "colored"

module PollDeploy
  class Console
    def self.log_step(message)
      puts message.bold.green
    end
    
    def self.log_substep(message)
      puts message.blue
    end
    
    def self.log_info(message)
      puts message.white
    end
    
    def self.log_warning(message)
      puts message.yellow
    end
    
    def self.log_error(message)
      puts message.red
    end
    
    def self.ask(message)
      answered = false
      until answered
        print message
        print " (y/n) "
        
        case $stdin.gets.strip.downcase
        when "y", "yes"
          answered = true
          return true
        when "n", "no"
          answered = true
          return false
        end
      end
    end
  end
end
