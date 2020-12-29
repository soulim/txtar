# frozen_string_literal: true

require_relative "lib/txtar/version"

Gem::Specification.new do |spec|
  spec.name          = "txtar"
  spec.version       = Txtar::VERSION
  spec.authors       = ["Alexander Sulim"]
  spec.email         = ["hello@sul.im"]

  spec.summary       = "Ruby implementation of txtar Go package."
  spec.description   = ""
  spec.homepage      = "https://github.com/soulim/txtar"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/soulim/txtar"
  # TODO: Add CHANGELOG.md
  # spec.metadata["changelog_uri"] = ""

  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|docs|bin)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", "~> 5.14"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
  spec.add_development_dependency "rubocop-minitest", "~> 0.10"
  spec.add_development_dependency "rubocop-rake", "~> 0.5"
end
