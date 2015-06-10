# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'polldeploy/info'

Gem::Specification.new do |spec|
  spec.name          = "polldeploy"
  spec.version       = PollDeploy::VERSION
  spec.authors       = ["Michaël Fortin"]
  spec.email         = ["michael@simbioz.com"]

  spec.summary       = "Poll services for resources, then download and deploy them on the local machine"
  spec.homepage      = "https://github.com/fortinmike/polldeploy"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec)/}) }
  spec.executables   = ["polldeploy"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "win32-service", "~> 0.8.6"
  spec.add_runtime_dependency "teamcity-ruby-client", "~> 1.3.1"
end
