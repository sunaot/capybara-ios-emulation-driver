# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara-ios-emulation-driver/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-ios-emulation-driver"
  spec.version       = Capybara::IosEmulationDriver::VERSION
  spec.authors       = ["sunaot"]
  spec.email         = ["sunao.tanabe@gmail.com"]
  spec.summary       = "Enable drivers to emulate iOS user agent."
  spec.description   = ''
  spec.homepage      = "https://github.com/sunaot/capybara-selenium-driver-ios-emulation"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 2.0.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "capybara"
  spec.add_dependency "selenium-webdriver"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", '~> 5.0'
end
