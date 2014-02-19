# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ore_ext/version'

Gem::Specification.new do |spec|
  spec.name          = "ore_ext"
  spec.version       = OreExt::VERSION
  spec.authors       = ["pinzolo"]
  spec.email         = ["pinzolo@gmail.com"]
  spec.description   = %q{This is extension of Ruby core library for me.}
  spec.summary       = %q{My extension of Ruby core library}
  spec.homepage      = "https://github.com/pinzolo/ore_ext"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
