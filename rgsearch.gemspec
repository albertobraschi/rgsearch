# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rgsearch}
  s.version = "0.9"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["TangZero"]
  s.date = %q{2009-03-06}
  s.email = %q{t4ngz3r0@gmail.com}
  s.files = ["lib/rgsearch/exception.rb", "lib/rgsearch/search.rb", "lib/rgsearch/base_result.rb", "lib/rgsearch/request.rb", "lib/rgsearch/result.rb", "lib/rgsearch/resultset.rb", "lib/rgsearch.rb", "Rakefile", "README.textile"]
  s.homepage = %q{http://github.com/tangzero/rgsearch}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rgsearch}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby Google Search Mashup Framework}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.1.1"])
    else
      s.add_dependency(%q<json>, [">= 1.1.1"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.1.1"])
  end
end
