# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController do
  subject { get :index }

  describe 'GET index' do
    it 'writes to stream 5 times' do
      expect { subject }.to write_to_stream.exactly(5).times
    end

    it 'writes 1 exactly ones' do
      expect { subject }.to write_to_stream('1').exactly(1).times
    end

    it 'writesa anything' do
      expect { subject }.to write_to_stream
    end
  end
end
