# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sankhya/version'

Gem::Specification.new do |spec|
  spec.name          = 'sankhya'
  spec.version       = Sankhya::VERSION
  spec.authors       = ['Geordee Naliyath']
  spec.email         = ['geordee@gmail.com']
  spec.summary       = 'A little gem to convert number to words in Indian English'
  spec.description   = 'Sankhya means numbers in Sanskrit and other Indian languages. This is a small gem to convert numbers to words in Indian English.'
  spec.homepage      = 'https://github.com/samyukti/sankhya'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
