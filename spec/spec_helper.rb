require "bundler/setup"
require "rspec/live_controllers"
require 'action_dispatch'

RSpec.configure do |config|
  config.include RSpec::LiveControllers::Matchers
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
