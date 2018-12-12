lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "imgclip/version"

Gem::Specification.new do |spec|
  spec.name         = "imgclip"
  spec.version      = Imgclip::VERSION
  spec.authors      = ["Valiantsin Mikhaliuk"]
  spec.email        = ["valiantsin.mikhaliuk@gmail.com"]

  spec.summary      = %q{Save images from the clipboard!}
  spec.homepage     = "https://github.com/vmikhaliuk/imgclip"
  spec.license      = "GPL-3.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/imgclip/extconf.rb"]
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake-compiler"
end
