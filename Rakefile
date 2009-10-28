begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "lesstile"
    gemspec.summary = "Format text using an exceedingly simple markup language - perfect for comments on your blog"
    gemspec.description = <<-EOS
Converts text formatted with an exceedingly simple markup language into XHTML (iron clad guarantee!) - perfect for comments on your blog. Textile isn't good for this because not only does it do too much (do commenters really need subscript?), but it can also output invalid HTML (try a <b> tag over multiple lines...). Whitelisting HTML is another option, but you still need some sort of parsing if you want syntax highlighting.

Integrates with CodeRay for sexy syntax highlighting.
    EOS
    gemspec.email = "contact@rhnh.net"
    gemspec.homepage = "http://github.com/xaviershay/lesstile"
    gemspec.authors = ["Xavier Shay"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new do |t|
  t.warning = false
  t.rcov = false
  t.spec_files = FileList['spec/spec_*.rb']
end

task :test => :spec
# vim: syntax=Ruby
