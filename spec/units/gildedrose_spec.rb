# frozen_string_literal: true

require 'gilded_rose'
require_relative '../support/doubles.rb'

describe GildedRose do
  include_context 'item_doubles'

  subject { described_class.new(items) }

  context 'for standard items:' do
    describe '#update_quality' do
      it 'does not change the name' do
        expect { subject.update_quality }.not_to change { other.name }
      end

      it 'decreases quality by 1' do
        expect { subject.update_quality }.to change { other.quality }.by(-1)
      end

      it 'decreases sell_in by 1' do
        expect { subject.update_quality }.to change { other.sell_in }.by(-1)
      end
    end
  end

  context 'for Aged Brie' do
    describe '#update_quality' do
      it 'increases quality by 1' do
        expect { subject.update_quality }.to change { brie.quality }.by(1)
      end

      it 'decreases sell_in by 1' do
        expect { subject.update_quality }.to change { brie.sell_in }.by(-1)
      end
    end
  end

  context 'for Sulfuras, Hand of Ragnaros' do
    describe '#update_quality' do
      it 'does not change quality' do
        expect { subject.update_quality }.not_to change { sulfuras.quality }
      end

      it 'does not change sell in' do
        expect { subject.update_quality }.not_to change { sulfuras.sell_in }
      end
    end
  end

  context 'for Backstage passes to a TAFKAL80ETC concert' do
    describe '#update_quality' do
      it 'decreases sell_in by 1' do
        expect { subject.update_quality }.to change { pass.sell_in }.by(-1)
      end

      it 'increases quality by 1 (for over 10 days)' do
        expect { subject.update_quality }.to change { pass.quality }.by(1)
      end

      it 'increases quality by 2 (for 5 to 10 days)' do
        5.times { subject.update_quality }
        expect { subject.update_quality }.to change { pass.quality }.by(2)
      end

      it 'increases quality by 3 (for less than 5 days)' do
        10.times { subject.update_quality }
        expect { subject.update_quality }.to change { pass.quality }.by(3)
      end

      it 'reduces quality to 0 when sell_in < 0' do
        15.times { subject.update_quality }
        expect { subject.update_quality }.to change { pass.quality }.to(0)
      end
    end
  end
end
