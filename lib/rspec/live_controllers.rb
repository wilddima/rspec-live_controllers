# frozen_string_literal: true

module RSpec
  module LiveControllers
    require 'active_support'
    extend ActiveSupport::Autoload

    autoload :Matchers, 'rspec/live_controllers/matchers'
    autoload :Version, 'rspec/live_controllers/version'
  end
end
