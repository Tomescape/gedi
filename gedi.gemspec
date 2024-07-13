# frozen_string_literal: true

require_relative "lib/gedi/version"

Gem::Specification.new do |spec|
  spec.name = "gedi"
  spec.version = Gedi::VERSION
  spec.authors = ["Kapil Kaisare"]
  spec.email = ["kkaisare@tomescape.com"]

  spec.summary = "A web server application framework."
  spec.description = "This is a learning project and is not intended for use in production."
  spec.homepage = "https://github.com/Tomescape/gedi"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.pkg.github.com/Tomescape'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Tomescape/gedi"
  spec.metadata["changelog_uri"] = "https://github.com/Tomescape/gedi/blob/production/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
