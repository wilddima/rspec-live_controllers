module RSpec
  module LiveControllers
    module Matchers
      class Base
        attr_reader :actual, :body, :target

        def initialize(actual)
          @actual = actual
        end

        def matches?(target)
          @target = target
          @body = extract_body(target)
          row = target_row(actual)
          json = target_json(actual)
          string = target_string(actual)
          check_matches?(body, row, json, string)
        end

        def failure_message
          raise 'Not implemented'
        end

        def failure_message_when_negated
          raise 'Not implemented'
        end

        protected

        def target_json(actual)
          return unless actual.respond_to?(:to_json)
          actual.to_json
        end

        def target_string(actual)
          actual.to_s
        end

        def target_row(actual)
          return actual if actual.is_a?(String) || actual.is_a?(Regexp)
        end

        def extract_body(target)
          if target.is_a?(ActionDispatch::Response::Buffer)
            target.instance_variable_get(:@buf).join('')
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
