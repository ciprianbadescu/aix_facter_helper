lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "aix_facter_helper/version"

Gem::Specification.new do |spec|
  spec.name          = "aix_facter_helper"
  spec.version       = AixFacterHelper::VERSION
  spec.authors       = ["Ciprian Badescu"]
  spec.email         = ["ciprian.badescu@puppet.com"]

  spec.summary       = %q{Short summary}
  spec.description   = %q{Longer description}
  spec.homepage      = "http://www.example.com"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://www.example.com"
  spec.metadata["changelog_uri"] = "http://www.example.com/CHANGELOG.md"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions << "ext/aix_facter_helper/extconf.rb"

  spec.add_development_dependency "rake-compiler"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end
