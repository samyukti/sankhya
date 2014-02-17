# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sankhya/version'

Gem::Specification.new do |spec|
  spec.name          = "sankhya"
  spec.version       = Sankhya::VERSION
  spec.authors       = ["Geordee Naliyath"]
  spec.email         = ["geordee@gmail.com"]
  spec.summary       = %q{A little gem to convert number to words in Indian English}
  spec.description   = %q{Sankhya means numbers in Sanskrit and other Indian languages. This is a small gem to convert numbers to words in Indian English.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
