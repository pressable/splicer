# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'splicer/version'

Gem::Specification.new do |spec|
  spec.name          = "splice"
  spec.version       = Splicer::VERSION
  spec.authors       = ["Matthew Johnston"]
  spec.email         = ["warmwaffles@gmail.com"]
  spec.description   = %q{Splicer allows communication with one or more dns providers}
  spec.summary       = %q{Splicer allows communication with one or more dns providers}
  spec.homepage      = "https://github.com/warmwaffles/splice"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
