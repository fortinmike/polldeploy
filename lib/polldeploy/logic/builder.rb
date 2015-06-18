require "polldeploy/logic/dsl/config_dsl"

module PollDeploy
  class Builder
    def self.build(config_file)
      config_source_code = File.read(File.expand_path(config_file))
      
      config_dsl = ConfigDsl.new
      config_dsl.instance_eval(config_source_code, config_file)
      
      return config_dsl.config
    end
  end
end
