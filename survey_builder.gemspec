$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "survey_builder/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "survey_builder"
  s.version     = SurveyBuilder::VERSION
  s.authors     = ["Kapil Garg"]
  s.email       = ["mail.kapilgarg@gmail.com"]
  s.homepage    = "http://www.qplum.co"
  s.summary     = "Survey Builder for websites."
  s.description = "SurveyBuilder helps you build surveys quicker."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
