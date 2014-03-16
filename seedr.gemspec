$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "seedr/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "seedr"
  s.version     = Seedr::VERSION
  s.authors     = ["Tim Boisvert and Rob Farrell"]
  s.email       = ["tboisvert@asheavenue.com, rfarrell@asheavenue.com"]
  s.homepage    = "https://github.com/AsheAvenue/Seedr"
  s.summary     = "Seed your models automatically or with helpers"
  s.description = "Seedr reads your model attributes and seeds them based on their type.  It also offers a collection\
                   of static helper methods to assist with manual seeding"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"
  s.add_dependency "titleize"

  s.add_development_dependency "sqlite3"
end
