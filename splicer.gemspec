# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'splicer/version'

Gem::Specification.new do |spec|
  spec.name          = 'splicer'
  spec.version       = Splicer::VERSION
  spec.authors       = ['Matthew Johnston', 'Joshua Stowers', 'Oliver Garcia']
  spec.email         = %w{warmwaffles@gmail.com joshua@pressable.com oliver@pressable.com}
  spec.description   = %q{Splicer allows communication with one or more dns providers}
  spec.summary       = %q{Use this gem if you are using multiple DNS providers, and want a unified interface to manage each of them simultaneously}
  spec.homepage      = 'https://github.com/pressable/splicer'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w{lib}

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
