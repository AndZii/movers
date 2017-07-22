# -*- encoding: utf-8 -*-
# stub: phonelib 0.6.12 ruby lib

Gem::Specification.new do |s|
  s.name = "phonelib"
  s.version = "0.6.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Vadim Senderovich"]
  s.date = "2017-06-03"
  s.description = "    Google libphonenumber library was taken as a basis for\n    this gem. Gem uses its data file for validations and number formatting.\n"
  s.email = ["daddyzgm@gmail.com"]
  s.homepage = "https://github.com/daddyz/phonelib"
  s.licenses = ["MIT"]
  s.rdoc_options = [" --no-private - CHANGELOG.md --readme README.md"]
  s.rubygems_version = "2.4.8"
  s.summary = "Gem validates phone numbers with Google libphonenumber database"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["< 11.0"])
      s.add_development_dependency(%q<nokogiri>, ["= 1.6.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["= 2.14.1"])
      s.add_development_dependency(%q<codeclimate-test-reporter>, ["~> 1.0.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rack-cache>, ["= 1.2"])
      s.add_development_dependency(%q<json>, ["= 1.8.6"])
    else
      s.add_dependency(%q<rake>, ["< 11.0"])
      s.add_dependency(%q<nokogiri>, ["= 1.6.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rspec>, ["= 2.14.1"])
      s.add_dependency(%q<codeclimate-test-reporter>, ["~> 1.0.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rack-cache>, ["= 1.2"])
      s.add_dependency(%q<json>, ["= 1.8.6"])
    end
  else
    s.add_dependency(%q<rake>, ["< 11.0"])
    s.add_dependency(%q<nokogiri>, ["= 1.6.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rspec>, ["= 2.14.1"])
    s.add_dependency(%q<codeclimate-test-reporter>, ["~> 1.0.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rack-cache>, ["= 1.2"])
    s.add_dependency(%q<json>, ["= 1.8.6"])
  end
end
