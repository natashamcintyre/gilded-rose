# frozen_string_literal: true

require 'gilded_rose'

SELL_IN = 15
QUALITY = 10

describe GildedRose do
  let(:brie) { Brie.new(SELL_IN, QUALITY) }
  let(:normal) { Normal.new('Normal', SELL_IN, QUALITY) }
  let(:pass) { Pass.new(SELL_IN, QUALITY) }
  let(:sulfuras) { Sulfuras.new }
  let(:conjured) { Conjured.new(SELL_IN, QUALITY) }
  let(:items) { [normal, brie, pass, sulfuras, conjured] }
  subject { described_class.new([normal, brie, pass, sulfuras, conjured]) }

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
