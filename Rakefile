require "bundler/gem_tasks"
task :default => :spec

require "rake/extensiontask"

Rake::ExtensionTask.new("aix_facter_helper") do |ext|
  ext.lib_dir = "lib/aix_facter_helper"
end
