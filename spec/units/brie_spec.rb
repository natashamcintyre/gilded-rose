# frozen_string_literal: true

require 'brie'

describe Brie do
  subject { described_class.new(10, 10) }
  describe '#update_quality' do
    it 'increases quality by 1' do
      expect { subject.update_quality }.to change { subject.quality }.by(1)
    end
    it 'quality will not go higher than 50' do
      subject.quality = 50
      expect { subject.update_quality }.not_to(change { subject.quality })
    end
  end
end
