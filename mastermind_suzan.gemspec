# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mastermind_suzan/version"

Gem::Specification.new do |spec|
  spec.name          = "mastermind_suzan"
  spec.version       = MastermindSuzan::VERSION
  spec.authors       = ["Susan Esho"]
  spec.email         = ["susan.esho@andela.com"]

  spec.summary       = ["This installs mastermind on the pc."]
  spec.description   = ["Mastermind is a game where a user tries to"]
  spec.homepage      = "https://github.com/andela-oesho/mastermind_suzan"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["mastermind"]
  spec.require_paths = ["bin/cli"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
