# -*- encoding: utf-8 -*-
require File.expand_path('../lib/xml_soccer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matt Augustine"]
  gem.email         = ["nosenseworrying@gmail.com"]
  gem.platform      = Gem::Platform::RUBY
  gem.description   = %q{Gem to interface with the xmlsoccer.com API}
  gem.summary       = %q{Gem to interface witht the xmlsoccer.com API}
  gem.homepage      = "https://github.com/nosenseworrying/xmlsoccer"
  gem.license       = "MIT"
  
  gem.required_ruby_version = ">= 2.0"
  gem.add_dependency "savon", "~> 2.3"
  gem.add_dependency "activesupport", ">= 3.0"
  gem.add_development_dependency "rspec", "~> 2.14"
  gem.add_development_dependency 'webmock', "~> 1.17"
  gem.add_development_dependency "rake", "~> 10.1"
  gem.add_runtime_dependency "supermodel", "~> 0.1"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "xml_soccer"
  gem.require_paths = ["lib"]
  gem.version       = XmlSoccer::VERSION
end
