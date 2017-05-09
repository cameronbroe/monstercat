# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monstercat/version'

Gem::Specification.new do |spec|
  spec.name          = "monstercat"
  spec.version       = Monstercat::VERSION
  spec.authors       = ["Cameron Roe"]
  spec.email         = ["cameron@cameronbroe.com"]

  spec.summary       = %q{A simple Ruby gem for accessing Monstercat's Connect API}
  spec.homepage      = "http://cameronbroe.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.14"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
