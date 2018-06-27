module RSpec
  module LiveControllers
    module Matchers
      class EndWithChunk < Base
        def regexp(reg)
          /#{reg}$/
        end

        def failure_message
          "Expect «#{response_body}» to have «#{list_of_matchers.join(' or' )}»" \
          "in the end of the stream."
        end

        def failure_message_when_negated
          "Expect «#{response_body}» to have «#{list_of_matchers.join(' or ')}»"\
          " in the end of the stream."
        end
      end
    end
  end
end
