# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'parsley_simple_form/version'

Gem::Specification.new do |spec|
  spec.name          = "parsley_simple_form"
  spec.version       = ParsleySimpleForm::VERSION
  spec.authors       = ["Matheus Cáceres", "Caio Tarifa"]
  spec.email         = "contato@formaweb.com.br"
  spec.description   = "ParsleyJS for Simple Form and Rails"
  spec.summary       = "ParsleyJS for Simple Form and Rails"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("simple_form")

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end