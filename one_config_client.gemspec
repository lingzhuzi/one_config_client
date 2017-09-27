$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "one_config_client/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "one_config_client"
  s.version     = OneConfigClient::VERSION
  s.authors     = ["YangHui"]
  s.email       = ["yanghui@tigerjoys.com"]
  s.homepage    = "https://github.com/lingzhuzi/memo"
  s.summary     = "OneConfigClient"
  s.description = "download config files from OneConfig"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib,bin}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.executables   = ["one_config"]

  s.add_dependency "activesupport"

end
