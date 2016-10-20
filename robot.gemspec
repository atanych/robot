# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'robot/version'

Gem::Specification.new do |spec|
  spec.name          = "robot"
  spec.version       = Robot::VERSION
  spec.authors       = ["atanych"]
  spec.email         = ["atanych@gmail.com"]

  spec.summary       = 'Toy Robot Simulator'
  spec.description   = 'Toy Robot Simulator'
  spec.homepage      = 'https://github.com/atanych/robot'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "activemodel", "~> 4.2"
  spec.add_development_dependency "ruby-try", "~> 1.1"
end
