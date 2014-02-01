# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boring/version'

Gem::Specification.new do |spec|
  spec.name          = "boring"
  spec.version       = Boring::VERSION
  spec.authors       = ["Andrew Bloom"]
  spec.email         = ["andrew@andrewkbloom.com"]
  spec.description   = %q{Video Player for the Boring Store}
  spec.summary       = %q{Raspberry Pi GPIO controller video player.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.bindir        = 'bin'
  spec.executables << 'boring'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "paint", "~> 0.8"
  spec.add_dependency "slop", "~> 3.4"
  spec.add_dependency "pi_piper", "~> 1.3"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
