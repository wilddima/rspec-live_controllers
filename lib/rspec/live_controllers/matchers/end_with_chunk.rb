module RSpec
  module LiveControllers
    module Matchers
      class EndWithChunk < Base
        def regexp(reg)
          /#{reg}$/
        end

        def failure_message
          "Expect «#{body}» to have «#{target}» in the end of the stream."
        end

        def failure_message_when_negated
          "Expect «#{body}» to have «#{target}» in the end of the stream."
        end
      end
    end
  end
end
