$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "role_block_haml/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "role_block_haml"
  s.homepage    = "https://github.com/vladson/role_block_haml"
  s.version     = RoleBlockHaml::VERSION
  s.authors     = ["Vladislav Bogomolov"]
  s.email       = ["vladson4ik@gmail.com"]
  s.summary     = "Easy shortcuts for haml"
  s.description = "Shortcuts for data-role and data-block (to use with evil-bloks-rails)"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.16"
  s.add_dependency "haml", "> 3.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "haml-rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.test_files = Dir["spec/**/*"]
end
