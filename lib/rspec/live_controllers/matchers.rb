# frozen_string_literal: true

module RSpec
  module LiveControllers
    module Matchers
      autoload :Base, 'rspec/live_controllers/matchers/base'
      autoload :WriteToStream, 'rspec/live_controllers/matchers/write_to_stream'

      def self.included(base)
        if ENV['RAILS_ENV'] != 'test'
          err = <<~HEREDOC
            ==========================
            STOP!
            ==========================
            Please, don't use "rspec-live_controllers" in any ENV, except 'test'.
            This gem monkey patches action_controller, so it can influence
            the whole app.
          HEREDOC
          if defined?(Rails) && Rails.respond_to?(:logger)
            Rails.logger.error(err)
          else
            puts err
          end
        end
        require 'rspec/core_ext/action_controller/metal/live'
        base.before { ActionController::Live::Buffer._writed_to_buffer = [] }
      end

      def write_to_stream(actual = nil)
        RSpec::LiveControllers::Matchers::WriteToStream.new(actual)
      end
    end
  end
end
