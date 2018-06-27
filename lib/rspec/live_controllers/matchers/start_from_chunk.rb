module RSpec
  module LiveControllers
    module Matchers
      class StartFromChunk < Base
        def regexp(reg)
          /^#{reg}/
        end
      end
    end
  end
end
