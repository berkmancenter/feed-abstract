# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "feed-abstract/version"

Gem::Specification.new do |s|
  s.name        = "feed-abstract"
  s.version     = Feed::Abstract::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daniel Collis-Puro"]
  s.email       = ["djcp@cyber.law.harvard.edu"]
  s.homepage    = "http://blogs.law.harvard.edu/djcp"
  s.summary     = %q{Abstracts RSS/Atom/RDF parsing features from the ruby standard lib into a common object graph.}
  s.description = %q{This library creates a common object graph for the RSS/Atom/RDF parsing classes in the ruby standard library. This allows you parse different feed formats and get back the same (or at least a very similar) set of results - item authors are accessible under an "author(s)" attribute, categories/tags/subjects are accessible under "category(ies)" attributes, etc. We do our best to make sure the data makes sense, too - RSS items lack an "updated" attribute, so we use "pubDate" to populate it. }

  s.rubyforge_project = "feed-abstract"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec", "2.6"
end
