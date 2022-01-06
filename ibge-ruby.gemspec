lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ibge/version'

Gem::Specification.new do |spec|
  spec.name          = 'ibge-ruby'
  spec.version       = IBGE::VERSION
  spec.summary       = "Wrapper do serviço do IBGE para Ruby."
  spec.authors       = ["Andréa Alencar"]
  spec.email         = 'andreaflether@gmail.com'
  spec.homepage      = 'https://rubygems.org/gems/ibge-ruby'
  spec.license       = 'MIT'

  # spec.files         = `git ls-files -z`.split("\x0")
  # spec.test_files    = spec.files.grep(/^spec\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'byebug'

  spec.add_dependency 'rest-client', '~> 2.0.2'
end