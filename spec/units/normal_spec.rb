# frozen_string_literal: true

require 'normal'

describe Normal do
  subject { described_class.new('name of item', 10, 10) }
  describe '#update_quality' do
    it 'decreases quality by 1' do
      expect { subject.update_quality }.to change { subject.quality }.by(-1)
    end

    it 'quality will not go lower than 0' do
      subject.quality = 0
      expect { subject.update_quality }.not_to(change { subject.quality })
    end

    it 'quality will reduce twice as fast when sell_in is below 0' do
      subject.sell_in = 0
      expect { subject.update_quality }.to change { subject.quality }.by(-2)
    end
  end
end
