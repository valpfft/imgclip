require "bundler/gem_tasks"
require "rake/extensiontask"

Rake::ExtensionTask.new(:imgclip) do |ext|
  ext.lib_dir = "lib/imgclip"
end

task :default => :spec
