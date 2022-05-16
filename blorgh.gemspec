require_relative "lib/blorgh/version"

Gem::Specification.new do |spec|
  spec.name = "blorgh"
  spec.version = Blorgh::VERSION
  spec.authors = ["Ezra Akeba"]
  spec.email = ["akebaezra@gmail.com"]
  spec.homepage = "https://example.com"
  spec.summary = "Simple blogging features"
  spec.description = "Allows creation of articles and comments"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ezrake/blorgh"
  spec.metadata["changelog_uri"] = "https://notavailable.com"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3"
end
