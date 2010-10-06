# encoding: UTF-8
require 'rake'
require 'rspec/core'
require 'rspec/core/rake_task'

Rspec::Core::RakeTask.new(:spec)
task :default => :spec

begin
  require "jeweler"
  Jeweler::Tasks.new do |gem|
    gem.name = "stateful_link"
    gem.summary = "Helper to generate stateful navigation links."
    gem.description = "Helper to generate stateful navigation links."
    gem.files =  FileList["[A-Z]*", "lib/**/*"]
    gem.version = "0.0.1"
    gem.email = "gzigzigzeo@gmail.com"
    gem.authors = ["Victor Sokolov"]
    gem.homepage = "http://github.com/gzigzigzeo/stateful_link"
            
    gem.add_dependency "rails", "~> 3.0.0"    
  end
  
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
