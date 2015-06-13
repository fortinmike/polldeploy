require "pathname"
require "os"

require "polldeploy/info"

module PollDeploy
  class Utils
    def self.path_in_gem(resource_path)
      gem_path = Gem::Specification.find_by_name(PollDeploy::GEM_NAME).gem_dir
      File.join(gem_path, resource_path)
    end
  end
end
