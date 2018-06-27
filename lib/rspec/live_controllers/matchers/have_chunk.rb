module RSpec
  module LiveControllers
    module Matchers
      class HaveChunk < Base
        def regexp(reg)
          /#{reg}/
        end

        def failure_message
          "Expect «#{response_body}» to have chunk: «#{list_of_matchers.join(' or ')}»."
        end

        def failure_message_when_negated
          "Expect «#{response_body}» not to have chunk: «#{list_of_matchers.join(' or ')}»."
        end
      end
    end
  end
end
