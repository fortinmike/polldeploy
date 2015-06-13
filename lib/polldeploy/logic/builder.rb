require "polldeploy/logic/dsl"

module PollDeploy
  class Builder
    def self.build(config_file)
      config_source_code = File.read(File.expand_path(config_file))
      
      dsl = Dsl.new
      dsl.instance_eval(config_source_code, config_file)
      
      return dsl.config
    end
  end
end
