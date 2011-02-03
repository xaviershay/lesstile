# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{lesstile}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Xavier Shay"]
  s.date = %q{2010-09-15}
  s.description = %q{Converts text formatted with an exceedingly simple markup language into valid HTML (iron clad guarantee!) - perfect for comments on your blog. Textile isn't good for this because not only does it do too much (do commenters really need subscript?), but it can also output invalid HTML (try a <b> tag over multiple lines...). Whitelisting HTML is another option, but you still need some sort of parsing if you want syntax highlighting.

Integrates with CodeRay for sexy syntax highlighting.
}
  s.email = %q{contact@rhnh.net}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "lesstile.gemspec",
    ".gitignore",
     "History.txt",
     "Manifest.txt",
     "README.rdoc",
     "Rakefile",
     "lib/lesstile.rb",
     "spec/lesstile_spec.rb",
     ".gemtest"
  ]
  s.homepage = %q{http://github.com/xaviershay/lesstile}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Format text using an exceedingly simple markup language - perfect for comments on your blog}
  s.test_files = [
    "spec/lesstile_spec.rb"
  ]
  s.add_development_dependency 'rspec', '~> 2.0.1'

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

