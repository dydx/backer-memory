# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'backer/memory/version'

Gem::Specification.new do |spec|
  spec.name          = "backer-memory"
  spec.version       = Backer::Memory::VERSION
  spec.authors       = ["Joshua Sandlin"]
  spec.email         = ["joshua.sandlin@gmail.com"]

  spec.summary       = %q{A simple in-memory repository for Backer}
  spec.description   = %q{A simple in-memory repository for Backer}
  spec.homepage      = "https://github.com/dydx/backer-memory.git"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
