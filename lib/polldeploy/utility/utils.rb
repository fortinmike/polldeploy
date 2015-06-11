require "pathname"
require "os"

require "polldeploy/info"

module PollDeploy
	class Utils
    def self.path_for_resource(resource_name)
      gem_path = Gem::Specification.find_by_name(PollDeploy::GEM_NAME).gem_dir
      File.join(gem_path, "resources/#{resource_name}")
    end
  end
end