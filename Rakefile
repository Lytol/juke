require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "juke"
    gem.summary = %Q{JSON API steps for Cucumber}
    gem.description = %Q{JSON API steps for Cucumber, hand-crafted for you in Juke *nod to Aruba*}
    gem.email = "bsmith@swig505.com"
    gem.homepage = "http://github.com/Lytol/juke"
    gem.authors = ["Brian Smith"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "yard", ">= 0"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
