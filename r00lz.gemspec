# frozen_string_literal: true

require_relative 'lib/r00lz/version'

Gem::Specification.new do |spec|
  spec.name          = 'r00lz'
  spec.version       = R00lz::VERSION
  spec.authors       = ['Patrick Shobe']
  spec.email         = ['patrick.shobe@housecallpro.com']

  spec.summary       = 'An example web framework'
  spec.description   = 'An example web framework but longer'
  spec.homepage      = 'http://home.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'http://mygemserver.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'http://home.com'
  spec.metadata['changelog_uri'] = 'http://home.com'
  spec.add_runtime_dependency 'json', '~>2.1.0'
  spec.add_runtime_dependency 'rack', '~>2.0.7'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
