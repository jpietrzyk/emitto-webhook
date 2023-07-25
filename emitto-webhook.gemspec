# frozen_string_literal: true

require_relative "lib/emitto/webhook/version"

Gem::Specification.new do |spec|
  spec.name = "emitto-webhook"
  spec.version = Emitto::Webhook::VERSION
  spec.authors = ["jpietrzyk"]
  spec.email = ["y4ck@tutanota.com"]

  spec.summary = "Emit event via http"
  spec.description = "Emits data to webhook"
  spec.homepage = "https://github.com/jpietrzyk/emitto-webhook"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["allowed_push_host"] = "https://github.com/jpietrzyk/emitto-webhook'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jpietrzyk/emitto-webhook"
  spec.metadata["changelog_uri"] = "https://github.com/jpietrzyk/emitto-webhook"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies
  # TODO Check if it is still needed (or just need to request it in Gemfile)
  spec.add_dependency "faraday"

  # Test and development dependencies
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "sinatra"
end
