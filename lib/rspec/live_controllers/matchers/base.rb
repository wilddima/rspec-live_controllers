module RSpec
  module LiveControllers
    module Matchers
      class Base
        attr_reader :actual


        def initialize(actual)
          @actual = actual
        end

        def matches?(target)
          body = extract_body(actual)
          row = target_row(target)
          json = target_json(target)
          string = target_string(target)
          check_matches?(body, row, json, string)
        end

        def failure_message
          'no'
        end

        def failure_message_when_negated
          'no to no'
        end

        protected

        def target_json(target)
          return unless target.respond_to?(:to_json)
          target.to_json
        end

        def target_string(target)
          target.to_s
        end

        def target_row(target)
          return target if target.is_a?(String) || target.is_a?(Regexp)
        end

        def extract_body(response)
          if actual.is_a?(ActionDispatch::Response::Buffer)
            response.instance_variable_get(:@buf)
          end
        end

        def regexp(reg)
          raise 'Not implemented'
        end

        def check_matches?(body, *matchers)
          matchers.compact.reduce(false) do |acc, value|
            reg = Regexp.quote(value)
            acc ||= body.match?(regexp(reg))
          end
        end
      end
    end
  end
end
