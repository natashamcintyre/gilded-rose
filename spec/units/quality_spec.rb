# frozen_string_literal: true

require 'quality'

# Rubocop block length disabled as testing needs to cover multiple contexts,
# including normal items, brie and the multiple different needs for backstage passes

describe Quality do # rubocop:disable Metrics/BlockLength
  include_context 'items'

  describe '#update' do # rubocop:disable Metrics/BlockLength
    context 'for normal items' do
      it 'reduces quality by 1' do
        expect { subject.update(normal) }.to change { normal.quality }.by(-1)
      end

      it 'quality will not go lower than 0' do
        normal.quality = 0
        expect { subject.update(normal) }.not_to(change { normal.quality })
      end

      it 'quality will reduce twice as fast when sell_in is below 0' do
        normal.sell_in = 0
        expect { subject.update(normal) }.to change { normal.quality }.by(-2)
      end
    end

    context 'brie' do
      it 'increases quality by 1' do
        expect { subject.update(brie) }.to change { brie.quality }.by(1)
      end

      it 'quality will not go higher than 50' do
        brie.quality = 50
        expect { subject.update(brie) }.not_to(change { brie.quality })
      end
    end

    context 'backstage pass' do # rubocop:disable Metrics/BlockLength
      # a long block to test edge cases of the different range requirements
      it 'quality will not go higher than 50' do
        pass.quality = 50
        expect { subject.update(pass) }.not_to(change { pass.quality })
      end

      it 'increases quality by 1 for sell_in date > 10, specifically 11' do
        pass.sell_in = 11
        expect { subject.update(pass) }.to change { pass.quality }.by(1)
      end

      it 'increases quality by 2 if sell_in date is 6..10, specifically 10' do
        pass.sell_in = 10
        expect { subject.update(pass) }.to change { pass.quality }.by(2)
      end

      it 'increases quality by 2 if sell_in date is 6..10, specifically 6' do
        pass.sell_in = 6
        expect { subject.update(pass) }.to change { pass.quality }.by(2)
      end

      it 'increases quality by 3 if sell_in date is 0..5, specifically 5' do
        pass.sell_in = 5
        expect { subject.update(pass) }.to change { pass.quality }.by(3)
      end

      it 'increases quality by 3 if sell_in date is 0..5, specifically 0' do
        pass.sell_in = 0
        expect { subject.update(pass) }.to change { pass.quality }.by(3)
      end

      it 'sets quality to 0 if sell_in date is negative' do
        pass.sell_in = -1
        expect { subject.update(pass) }.to change { pass.quality }.to(0)
      end
    end

    context 'conjured' do
      it 'decreases quality by 2' do
        expect { subject.update(conjured) }.to change { conjured.quality }.by(-2)
      end
    end
  end
end
