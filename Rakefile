require 'bundler'

require 'rspec/core'
require 'rspec/core/rake_task'
desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

Bundler::GemHelper.install_tasks
