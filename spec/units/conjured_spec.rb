# frozen_string_literal: true

require 'conjured'

describe Conjured do
  subject { described_class.new(10, 10) }
  describe '#update_quality' do
    it 'decreases quality by 2' do
      expect { subject.update_quality }.to change { subject.quality }.by(-2)
    end

    it 'will not let quality go below 0' do
      subject.quality = 1
      expect { subject.update_quality }.to change { subject.quality }.to(0)
    end

    it 'quality will reduce twice as fast when sell_in is below 0' do
      subject.sell_in = 0
      expect { subject.update_quality }.to change { subject.quality }.by(-4)
    end
  end
end
