require 'rspec/live_controllers/version'
require 'rspec/live_controllers/matchers/base'
require 'rspec/live_controllers/matchers/have_chunk'
require 'rspec/live_controllers/matchers/start_from_chunk'
require 'rspec/live_controllers/matchers/end_with_chunk'

module RSpec
  module LiveControllers
    module Matchers
      def start_from_chunk(actual)
        RSpec::LiveControllers::StartFromChunk.new(actual)
      end
    end
  end
end
