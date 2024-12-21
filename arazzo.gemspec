# frozen_string_literal: true

require_relative 'lib/arazzo/version'

Gem::Specification.new do |spec|
  spec.name = 'arazzo'
  spec.version = Arazzo::VERSION
  spec.authors = ['Nigel Brookes-Thomas']
  spec.email = ['nigel@brookes-thomas.co.uk']

  spec.summary = 'Arazzo parser.'
  spec.description = 'Arazzo parser.'
  spec.homepage = 'https://www.github.com/BillyRuffian'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://www.github.com/BillyRuffian'
  spec.metadata['changelog_uri'] = 'https://www.github.com/BillyRuffian'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'json-schema', '>= 5.1'
  spec.add_dependency 'semverse', '>= 3.0'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
