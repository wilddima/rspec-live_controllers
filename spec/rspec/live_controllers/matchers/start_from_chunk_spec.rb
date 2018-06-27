require 'spec_helper'

RSpec.describe RSpec::LiveControllers::Matchers::StartFromChunk do
  let(:matcher) { described_class.new(actual) }
  let(:target) { ActionDispatch::Response::Buffer.new(nil, stream) }
  let(:stream) { ['["hi"]["you"]'] }
  let(:actual) { ['hi'] }

  describe '#matches?' do
    subject { matcher.matches?(target) }

    it 'finds matches' do
      expect(subject).to be(true)
    end

    context 'doesn\'t find matches' do
      let(:actual) { ['you'] }

      it 'doesn\'t find matches' do
        expect(subject).to be(false)
      end
    end
  end
end
