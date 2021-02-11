# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do
  include_context 'items'
  let(:quality_double) { double :quality_double }
  let(:quality_class_double) { double :quality_class, new: quality_double }
  subject { described_class.new(items, quality_class_double) }

  before(:each) do
    allow(quality_double).to receive(:update)
  end

  describe '#update' do
    it 'decreases sell_in for normal items by 1' do
      expect { subject.update }.to change { normal.sell_in }.by(-1)
    end

    it 'decreases sell_in for Aged Brie by 1' do
      expect { subject.update }.to change { brie.sell_in }.by(-1)
    end

    it 'does not change sell in of Sulfuras, Hand of Ragnaros' do
      expect { subject.update }.not_to(change { sulfuras.sell_in })
    end

    it 'decreases sell_in for backstage passes by 1' do
      expect { subject.update }.to change { pass.sell_in }.by(-1)
    end
  end
end
