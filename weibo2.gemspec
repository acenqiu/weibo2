$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "weibo2/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "weibo2"
  s.version     = Weibo2::VERSION
  s.authors     = ["Acenqiu"]
  s.email       = ["acenqiu@gmail.com"]
  s.homepage    = "https://github.com/acenqiu/weibo2"
  s.summary     = "A wrapper for Weibo OAuth2 API"
  s.description = "A wrapper for Weibo OAuth2 API"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  #s.add_dependency "rails", "~> 3.1.0"
  s.add_dependency "oauth2", "~> 0.5.1"

  s.add_development_dependency "rspec-rails"
end
