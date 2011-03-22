# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "stateful_link/version"

Gem::Specification.new do |s|
  s.name = "stateful_link"
  s.version     = StatefulLink::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary = "Helper to generate stateful navigation links."
  s.description = "Helper to generate stateful navigation links."
  s.email = "gzigzigzeo@gmail.com"
  s.authors = ["Victor Sokolov"]
  s.homepage = "http://github.com/gzigzigzeo/stateful_link"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_runtime_dependency(%q<rails>, [">= 3"])
  s.add_development_dependency(%q<rspec-rails>, "~> 2.4")
  s.add_development_dependency(%q<capybara>)
  s.add_development_dependency(%q<sqlite3-ruby>)  
end