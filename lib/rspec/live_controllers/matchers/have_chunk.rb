module RSpec
  module LiveControllers
    module Matchers
      class HaveChunk < Base
        def regexp(reg)
          /#{reg}/
        end
      end
    end
  end
end
