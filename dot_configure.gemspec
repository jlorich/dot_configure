# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dot_configure/version'

Gem::Specification.new do |spec|
  spec.name          = "dot_configure"
  spec.version       = DotConfigure::VERSION
  spec.authors       = ["Joey Lorich"]
  spec.email         = ["jospeh@lorich.me"]
  spec.summary       = %q{Simple configuration options}
  spec.description   = %q{Simple configuration options}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'pry-byebug', '~> 1.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0.0'
  spec.add_development_dependency 'clint_eastwood', '~> 0.0.1'
end
