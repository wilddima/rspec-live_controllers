# frozen_string_literal: true

module ActionController
  module Live
    class Buffer < ActionDispatch::Response::Buffer
      cattr_accessor :_writed_to_buffer

      def write(string)
        @@_writed_to_buffer ||= []
        @@_writed_to_buffer << string.to_s
        super
      end
    end
  end
end
