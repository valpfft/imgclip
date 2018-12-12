require "bundler/gem_tasks"
require "rake/extensiontask"
require "rspec/core/rake_task"

Rake::ExtensionTask.new(:imgclip) do |ext|
  ext.lib_dir = "lib/imgclip"
end

RSpec::Core::RakeTask.new(spec: %i[clean compile])

task :default => :spec
