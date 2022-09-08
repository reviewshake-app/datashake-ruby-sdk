# frozen_string_literal: true

require_relative "lib/datashake-ruby-sdk/version"

Gem::Specification.new do |spec|
  spec.name = "datashake-ruby-sdk"
  spec.version = Datashake::VERSION
  spec.authors = ["Reviewshake <3 Datashake"]
  spec.email = ["dev@shake.io"]

  spec.summary = "An API wrapper for Datashake API"
  spec.homepage = "https://docs.datashake.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/reviewshake/datashake-ruby-sdk"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "dry-struct", "~>1.0"
  spec.add_dependency "faraday", "~> 2.2"
end
