require_relative "command"

module PollDeploy
  class InitCommand < Command
    self.command = "init"
    self.summary = "Initialize polldeploy on this machine."

    def run
      puts "Initializing!"
    end
  end
end