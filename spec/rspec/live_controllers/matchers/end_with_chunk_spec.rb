require 'spec_helper'

RSpec.describe RSpec::LiveControllers::Matchers::EndWithChunk do
  let(:matcher) { described_class.new(actual) }
  let(:stream) { '["hi"]["you"]' }
  let(:actual) { ['hi'] }
  let(:target) { ActionDispatch::Response::Buffer.new(nil, stream) }

  describe '#matches?' do
    subject { matcher.matches?(target) }

    it 'doesn\'t find matches' do
      expect(subject).to be(false)
    end

    context 'doesn\'t find matches' do
      let(:actual) { ['you'] }

      it 'finds matches' do
        expect(subject).to be(true)
      end
    end
  end
end
