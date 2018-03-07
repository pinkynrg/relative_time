$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "relative_time/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "relative_time"
  s.version     = RelativeTime::VERSION
  s.authors     = ["pinkynrg"]
  s.email       = ["biggyapple@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RelativeTime."
  s.description = "TODO: Description of RelativeTime."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"

  s.add_development_dependency "sqlite3"
end
