module RSpec
  module LiveControllers
    module Matchers
      class HaveChunk < Base
        def regexp(reg)
          /#{reg}/
        end

        def failure_message
          "Expect «#{body}» to have chunk: «#{target}»."
        end

        def failure_message_when_negated
          "Expect «#{body}» not to have chunk: «#{target}»."
        end
      end
    end
  end
end
