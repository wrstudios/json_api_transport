# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'json_api_transport/version'

Gem::Specification.new do |spec|
  spec.name          = "json_api_transport"
  spec.version       = JsonApiTransport::VERSION
  spec.authors       = ["Paul Gustafson", "Jon Druse"]
  spec.email         = ["paul@wrstudios.com", "jon@wrstudios.com"]

  spec.summary       = "A gem to better interact with a JSON API compliant API" 
  spec.homepage      = "http://www.wrstudios.com"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "byebug", "~> 6.0"

  spec.add_dependency 'pry', "~> 0.10"
  spec.add_dependency 'activesupport', "~> 4.2"
  
end
