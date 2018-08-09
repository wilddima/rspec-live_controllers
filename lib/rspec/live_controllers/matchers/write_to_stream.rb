# frozen_string_literal: true

module RSpec
  module LiveControllers
    module Matchers
      class WriteToStream < Base
        attr_reader :expected, :actual,
                    :count_type, :count

        def initialize(expected)
          @expected = expected
        end

        def matches?(actual = nil)
          @actual = actual
          start_buffer = writed_to_buffer.dup || []
          actual.call
          writed_diff_size = (writed_to_buffer.size - start_buffer.size) unless actual
          writed_diff_size ||= \
            if expected
              diff_arr = start_buffer - writed_to_buffer | writed_to_buffer - start_buffer
              diff_arr.select { |i| i == expected }.count
            else
              (writed_to_buffer.size - start_buffer.size)
            end
          case count_type
          when :at_least
            writed_diff_size >= count
          when :at_most
            writed_diff_size <= count
          when :exactly
            writed_diff_size == count
          else
            writed_diff_size.positive?
          end
        end

        def supports_block_expectations?
          true
        end

        def at_least(count)
          @count_type = :at_least
          @count = count
          self
        end

        def exactly(count)
          @count_type = :exactly
          @count = count
          self
        end

        def at_most(count)
          @count_type = :at_most
          @count = count
          self
        end

        def times
          self
        end

        def failure_message
          "Expect «#{writed_to_buffer}» to have chunk: «#{expected}»."
        end

        def failure_message_when_negated
          "Expect «#{writed_to_buffer}» not to have chunk: «#{expected}»."
        end
      end
    end
  end
end
