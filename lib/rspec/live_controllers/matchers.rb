require 'rspec/live_controllers/version'
require 'rspec/live_controllers/matchers/base'
require 'rspec/live_controllers/matchers/have_chunk'
require 'rspec/live_controllers/matchers/start_from_chunk'
require 'rspec/live_controllers/matchers/end_with_chunk'

module RSpec
  module LiveControllers
    module Matchers
      def start_from_chunk(actual)
        RSpec::LiveControllers::Matchers::StartFromChunk.new(actual)
      end

      def end_with_chunk(actual)
        RSpec::LiveControllers::Matchers::EndWithChunk.new(actual)
      end

      def have_chunk(actual)
        RSpec::LiveControllers::Matchers::HaveChunk.new(actual)
      end
    end
  end
end
