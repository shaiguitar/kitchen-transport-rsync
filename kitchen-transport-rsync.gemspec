# -*- encoding: utf-8 -*-
lib = File.expand_path("./lib", File.dirname(__FILE__))
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "kitchen/transport/version.rb"

Gem::Specification.new do |gem|
  gem.name          = "kitchen-transport-rsync"
  gem.version       = Kitchen::Transport::RSYNC_VERSION
  gem.license       = "Do whatever the fuck you want license"
  gem.authors       = ["Eric Fode", "Shai Rosenfeld", "Luke Robles"]
  gem.email         = ["ericfode@gmail.com", "shaiguitar@gmail.com"  ]
  gem.description   = "A faster transport method than the default SSH test-kitchen"
  gem.summary       = gem.description
  gem.homepage      = "http://kitchen.ci/"

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = []
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "test-kitchen", "~> 1.4", ">= 1.4.1"
  gem.add_dependency "rsync", "~> 1.0.9", ">= 1.0.9"

  gem.add_development_dependency "rspec",     "~> 3.2"
end
