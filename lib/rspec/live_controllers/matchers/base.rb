module RSpec
  module LiveControllers
    module Matchers
      class Base
        attr_reader :actual_matcher, :response_body, :target_response, :list_of_matchers

        def initialize(actual_matcher)
          @actual_matcher = actual
        end

        def matches?(target_response)
          @target_response = target
          @response_body = extract_body(target_response)
          row = target_response_row(actual_matcher)
          json = target_response_json(actual_matcher)
          string = target_response_string(actual_matcher)
          check_matches?(response_body, row, json, string)
        end

        def failure_message
          raise 'Not implemented'
        end

        def failure_message_when_negated
          raise 'Not implemented'
        end

        protected

        def target_response_json(actual_matcher)
          return unless actual_matcher.respond_to?(:to_json)
          actual_matcher.to_json
        end

        def target_response_string(actual_matcher)
          actual_matcher.to_s
        end

        def target_response_row(actual_matcher)
          return actual_matcher if actual.is_a?(String) || actual.is_a?(Regexp)
        end

        def extract_response_body(target_response)
          if target_response.is_a?(ActionDispatch::Response::Buffer)
            target_response.instance_variable_get(:@buf).join('')
          end
        end

        def regexp(reg)
          raise 'Not implemented'
        end

        def check_matches?(response_body, *matchers)
          @list_of_matchers = matchers.compact
          checkers.reduce(false) do |acc, value|
            reg = Regexp.quote(value)
            acc ||= response_body.match?(regexp(reg))
          end
        end
      end
    end
  end
end
