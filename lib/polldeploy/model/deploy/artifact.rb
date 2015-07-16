require "tmpdir"

module PollDeploy
  class Artifact
    attr_accessor :name
    attr_accessor :url
    attr_accessor :file

    def initialize(name, url)
      @name = name
      @url = url
      @file = File.join(Dir.mktmpdir, name)
    end
  end
end
