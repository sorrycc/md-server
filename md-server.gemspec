# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "md-server"
  s.version     = HTTParty::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["ChenCheng"]
  s.email       = ["sorrycc@gmail.com"]
  s.homepage    = "http://www.github.com/sorrycc/md-server"
  s.summary     = %q{Markdown Server.}
  s.description = %q{Markdown Server.}

  s.required_ruby_version     = '>= 1.9.3'

  # s.add_dependency "sinatra", ">= 1.4.4"
  # s.add_dependency "sinatra-contrib", ">= 1.4.0"
  # s.add_dependency "markdown", ">= 1.1.1"
  # s.add_dependency "optparse", ""

  s.files         = `git ls-files`.split("\n")
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
