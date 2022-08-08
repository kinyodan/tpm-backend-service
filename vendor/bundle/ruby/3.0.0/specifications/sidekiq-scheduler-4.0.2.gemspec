# -*- encoding: utf-8 -*-
# stub: sidekiq-scheduler 4.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "sidekiq-scheduler".freeze
  s.version = "4.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Morton Jonuschat".freeze, "Moove-it".freeze, "Marcelo Lauxen".freeze]
  s.date = "2022-06-27"
  s.description = "Light weight job scheduling extension for Sidekiq that adds support for queueing jobs in a recurring way.".freeze
  s.email = ["sidekiq-scheduler@moove-it.com".freeze, "marcelolauxen16@gmail.com".freeze]
  s.homepage = "https://sidekiq-scheduler.github.io/sidekiq-scheduler/".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.2.22".freeze
  s.summary = "Light weight job scheduling extension for Sidekiq".freeze

  s.installed_by_version = "3.2.22" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<sidekiq>.freeze, [">= 4"])
    s.add_runtime_dependency(%q<redis>.freeze, [">= 4.2.0"])
    s.add_runtime_dependency(%q<rufus-scheduler>.freeze, ["~> 3.2"])
    s.add_runtime_dependency(%q<tilt>.freeze, [">= 1.4.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<timecop>.freeze, [">= 0"])
    s.add_development_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<mock_redis>.freeze, ["~> 0.28.0"])
    s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_development_dependency(%q<activejob>.freeze, [">= 0"])
    s.add_development_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_development_dependency(%q<sinatra>.freeze, [">= 0"])
  else
    s.add_dependency(%q<sidekiq>.freeze, [">= 4"])
    s.add_dependency(%q<redis>.freeze, [">= 4.2.0"])
    s.add_dependency(%q<rufus-scheduler>.freeze, ["~> 3.2"])
    s.add_dependency(%q<tilt>.freeze, [">= 1.4.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<timecop>.freeze, [">= 0"])
    s.add_dependency(%q<mocha>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<mock_redis>.freeze, ["~> 0.28.0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<activejob>.freeze, [">= 0"])
    s.add_dependency(%q<rack-test>.freeze, [">= 0"])
    s.add_dependency(%q<sinatra>.freeze, [">= 0"])
  end
end
