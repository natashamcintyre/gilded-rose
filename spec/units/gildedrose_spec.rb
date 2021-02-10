# frozen_string_literal: true

require 'gilded_rose'

# Rubocop block length disabled as testing needs to cover multiple contexts,
# including normal items, brie and the multiple different needs for backstage passes

describe GildedRose do # rubocop:disable Metrics/BlockLength
  include_context 'items'
  # include_context 'item_quality_double'
  # Struggling to figure out how to mock

  subject { described_class.new(items) }

  context 'for normal items' do
    describe '#update' do
      # it "doesn't decrease quality as that's in the quality class, but it does
      # call on the update on the quality class. Should I check that?" do
      #   expect { subject.update }.to change { normal.quality }.by(-1)
      # end

      it 'decreases sell_in by 1' do
        expect { subject.update }.to change { normal.sell_in }.by(-1)
      end
    end
  end

  context 'for Aged Brie' do
    describe '#update' do
      # it 'increases quality by 1' do
      #   expect { subject.update }.to change { brie.quality }.by(1)
      # end

      it 'decreases sell_in by 1' do
        expect { subject.update }.to change { brie.sell_in }.by(-1)
      end
    end
  end

  context 'for Sulfuras, Hand of Ragnaros' do
    describe '#update' do
      # it 'does not change quality' do
      #   expect { subject.update }.not_to(change { sulfuras.quality })
      # end

      it 'does not change sell in' do
        expect { subject.update }.not_to(change { sulfuras.sell_in })
      end
    end
  end

  context 'for Backstage passes to a TAFKAL80ETC concert' do
    describe '#update' do
      it 'decreases sell_in by 1' do
        expect { subject.update }.to change { pass.sell_in }.by(-1)
      end

      # it 'increases quality by 1 (for over 10 days)' do
      #   expect { subject.update }.to change { pass.quality }.by(1)
      # end
      #
      # it 'increases quality by 2 (for 5 to 10 days)' do
      #   5.times { subject.update }
      #   expect { subject.update }.to change { pass.quality }.by(2)
      # end
      #
      # it 'increases quality by 3 (for less than 5 days)' do
      #   10.times { subject.update }
      #   expect { subject.update }.to change { pass.quality }.by(3)
      # end
      #
      # it 'reduces quality to 0 when sell_in < 0' do
      #   15.times { subject.update }
      #   expect { subject.update }.to change { pass.quality }.to(0)
      # end
    end
  end
end
