# frozen_string_literal: true

require 'pass'

# rubocop disabled as tests needed to cover edge cases

describe Pass do # rubocop:disable Metrics/BlockLength
  subject { described_class.new(20, 10) }

  describe '#update_quality' do # rubocop:disable Metrics/BlockLength
    it 'quality will not go higher than 50' do
      subject.quality = 50
      expect { subject.update_quality }.not_to(change { subject.quality })
    end
    it 'increases quality by 1 for sell_in date > 10, specifically 11' do
      subject.sell_in = 11
      expect { subject.update_quality }.to change { subject.quality }.by(1)
    end

    it 'increases quality by 2 if sell_in date is 6..10, specifically 10' do
      subject.sell_in = 10
      expect { subject.update_quality }.to change { subject.quality }.by(2)
    end

    it 'increases quality by 2 if sell_in date is 6..10, specifically 6' do
      subject.sell_in = 6
      expect { subject.update_quality }.to change { subject.quality }.by(2)
    end

    it 'increases quality by 3 if sell_in date is 0..5, specifically 5' do
      subject.sell_in = 5
      expect { subject.update_quality }.to change { subject.quality }.by(3)
    end

    it 'increases quality by 3 if sell_in date is 0..5, specifically 0' do
      subject.sell_in = 0
      expect { subject.update_quality }.to change { subject.quality }.by(3)
    end

    it 'sets quality to 0 if sell_in date is negative' do
      subject.sell_in = -1
      expect { subject.update_quality }.to change { subject.quality }.to(0)
    end
  end
end
