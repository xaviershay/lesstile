# RSpec provided helper doesn't like me, for now just run it myself
desc "Run specs"
task :spec do
  commands = []
  commands << "bundle exec rspec spec/*_spec.rb"
  exec commands.join(" && ")
end

task :test    => :spec
task :default => :spec
