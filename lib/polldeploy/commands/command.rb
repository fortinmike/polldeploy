require "claide"

require "polldeploy/info"

module PollDeploy
  class Command < CLAide::Command
    self.abstract_command = true
    self.command = "polldeploy"
    self.version = PollDeploy::VERSION
    self.description = PollDeploy::DESCRIPTION
  end
end
