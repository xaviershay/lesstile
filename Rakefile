require 'spec/rake/spectask'
Spec::Rake::SpecTask.new do |t|
  t.warning = false
  t.rcov = false
  t.spec_files = FileList['spec/spec_*.rb']
end

task :test    => :spec
task :default => :spec
