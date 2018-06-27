module RSpec
  module LiveControllers
    module Matchers
      class StartFromChunk < Base
        def regexp(reg)
          /^#{reg}/
        end

        def failure_message
          "Expect «#{body}» to have «#{target}» in the start of the stream."
        end

        def failure_message_when_negated
          "Expect «#{body}» to have «#{target}» in the start of the stream."
        end
      end
    end
  end
end
