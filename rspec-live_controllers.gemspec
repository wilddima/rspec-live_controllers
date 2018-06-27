
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "rspec/live_controllers/version"

Gem::Specification.new do |spec|
  spec.name          = "rspec-live_controllers"
  spec.version       = RSpec::LiveControllers::VERSION
  spec.authors       = ["WildDima"]
  spec.email         = ["dtopornin@gmail.com"]

  spec.summary       = %q{RSpec matchers for live controller response}
  spec.description   = %q{RSpec matchers for live controller response}
  spec.homepage      = "https://github.com/wilddima/rspec-live_controllers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency 'actionpack', '~> 5'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
