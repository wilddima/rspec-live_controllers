# frozen_string_literal: true

module RSpec
  module LiveControllers
    module Matchers
      class Base
        attr_reader :actual_matcher, :target_response

        def initialize(actual_matcher)
          @actual_matcher = actual_matcher
        end

        def failure_message
          raise 'Not implemented'
        end

        def failure_message_when_negated
          raise 'Not implemented'
        end

        protected

        def writed_to_buffer
          ActionController::Live::Buffer._writed_to_buffer
        end
      end
    end
  end
end
