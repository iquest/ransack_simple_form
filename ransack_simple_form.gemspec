# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ransack_simple_form/version'

Gem::Specification.new do |spec|
  spec.name          = "ransack_simple_form"
  spec.version       = RansackSimpleForm::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Pavel Dusanek"]
  spec.email         = ["dusanek@iquest.cz"]
  spec.description   = %q{Ransack search form using SimpleForm}
  spec.summary       = %q{Form helper generating Ransack search form by SimpleForm input helpers}
  spec.homepage      = "https://github.com/iquest/ransack_simple_form"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'ransack', '>= 1.1'
  spec.add_dependency 'simple_form', '>= 3.0'  
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
