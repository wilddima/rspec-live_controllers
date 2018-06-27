require 'spec_helper'

RSpec.describe RSpec::LiveControllers::Matchers::HaveChunk do
  let(:matcher) { described_class.new(response_stream) }
  let(:response_stream) { ActionDispatch::Response::Buffer.new(nil, stream) }
  let(:stream) { '["hi"]["you"]' }

  describe '#matches?' do
    subject { matcher.matches?(target) }

    let(:target) { ['hi'] }

    it 'finds matches' do
      expect(subject).to be(true)
    end

    context 'doesn\'t find matches' do
      let(:target) { ['you'] }

      it 'finds matches' do
        expect(subject).to be(true)
      end
    end
  end
end
