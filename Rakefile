# -*- encoding: utf-8 -*-

require 'bundler'
require './lib/feed-abstract'
Bundler::GemHelper.install_tasks

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "feed-abstract"
    s.version     = FeedAbstract::VERSION
    s.homepage    = "https://github.com/berkmancenter/feed-abstract"
    s.summary     = %q{Abstracts RSS/Atom/RDF stdlib parsing into a common object graph.}
    s.description = %q{This library creates a common object graph for the RSS/Atom/RDF parsing classes in the ruby standard library. This allows you parse different feed formats and get back the same (or at least a very similar) set of results - item authors are accessible under an "author(s)" attribute, categories/tags/subjects are accessible under "category(ies)" attributes, etc. We do our best to make sure the data makes sense, too - RSS items lack an "updated" attribute, so we use "pubDate" to populate it. }
    s.authors     = ["Daniel Collis-Puro"]
    s.email       = ["djcp@cyber.law.harvard.edu"]
    s.files         = `git ls-files`.split("\n")
    s.rdoc_options = ["--charset=UTF-8"]
    s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]
    s.extra_rdoc_files = [
      "README.rdoc"
    ]
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available."
end

Jeweler::RubygemsDotOrgTasks.new

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "footest #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
