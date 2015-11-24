# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'splicer/version'

Gem::Specification.new do |spec|
  spec.name          = "splicer"
  spec.version       = Splicer::VERSION
  spec.authors       = ["Matthew Johnston", "Joshua Stowers"]
  spec.email         = ["warmwaffles@gmail.com", "joshua@pressable.com"]
  spec.description   = %q{Splicer allows communication with one or more dns providers}
  spec.summary       = %q{Use this gem if you are using multiple DNS providers, and want a unified interface to manage each of them simultaneously}
  spec.homepage      = "https://github.com/pressable/splicer"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.3', '>= 1.3.0'
  spec.add_development_dependency 'rake', '~> 10.4', '>= 10.4.0'
  spec.add_development_dependency 'rspec', '~> 3.4.0', '>= 3.4.0'
end
