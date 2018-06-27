module RSpec
  module LiveControllers
    module Matchers
      class EndWithChunk < Base
        def regexp(reg)
          /#{reg}$/
        end
      end
    end
  end
end
