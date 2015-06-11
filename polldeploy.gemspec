# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "polldeploy/info"

Gem::Specification.new do |spec|
  spec.name          = PollDeploy::GEM_NAME
  spec.version       = PollDeploy::VERSION
  spec.authors       = ["Michaël Fortin"]
  spec.email         = ["michael@simbioz.com"]

  spec.summary       = PollDeploy::DESCRIPTION
  spec.homepage      = "https://github.com/fortinmike/polldeploy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec)/}) }
  spec.executables   = ["polldeploy"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "claide", "~> 0.8.1"
  spec.add_runtime_dependency "colored", "~> 1.2"
  spec.add_runtime_dependency "os", "~> 0.9.6"
  spec.add_runtime_dependency "win32-service", "~> 0.8.6"
  spec.add_runtime_dependency "teamcity-ruby-client", "~> 1.3.1"
end
