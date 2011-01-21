# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{stateful_link}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Victor Sokolov"]
  s.date = %q{2011-01-21}
  s.description = %q{Helper to generate stateful navigation links.}
  s.email = %q{gzigzigzeo@gmail.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "lib/stateful_link.rb",
    "lib/stateful_link/action_any_of.rb",
    "lib/stateful_link/helper.rb",
    "lib/stateful_link/railtie.rb"
  ]
  s.homepage = %q{http://github.com/gzigzigzeo/stateful_link}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Helper to generate stateful navigation links.}
  s.test_files = [
    "spec/controllers/action_any_of_spec.rb",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/routes.rb",
    "spec/helpers/stateful_link_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3"])
      s.add_runtime_dependency(%q<capybara>, [">= 0.3.9"])
      s.add_runtime_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<rspec-rails>, [">= 2.0.0.beta"])
      s.add_development_dependency(%q<childprocess>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0.10.3"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
    else
      s.add_dependency(%q<rails>, [">= 3"])
      s.add_dependency(%q<capybara>, [">= 0.3.9"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 2.0.0.beta"])
      s.add_dependency(%q<childprocess>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0.10.3"])
      s.add_dependency(%q<rails>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3"])
    s.add_dependency(%q<capybara>, [">= 0.3.9"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 2.0.0.beta"])
    s.add_dependency(%q<childprocess>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0.10.3"])
    s.add_dependency(%q<rails>, [">= 3.0.0"])
  end
end

