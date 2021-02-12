# frozen_string_literal: true

require 'gilded_rose'

SELL_IN = 15
QUALITY = 10

# Feature testing for all types of items, so rubocop block length disabled
describe 'the gildedrose updates items appropriately' do # rubocop:disable Metrics/BlockLength
  let(:brie) { Brie.new(SELL_IN, QUALITY) }
  let(:normal) { Normal.new('Normal', SELL_IN, QUALITY) }
  let(:pass) { Pass.new(SELL_IN, QUALITY) }
  let(:sulfuras) { Sulfuras.new }
  let(:conjured) { Conjured.new(SELL_IN, QUALITY) }
  let(:items) { [normal, brie, pass, sulfuras, conjured] }
  before(:each) do
    gilded_rose = GildedRose.new(items)
    gilded_rose.update
  end

  it 'updates normal items appropriately, reducing quality and sell_in by 1' do
    expect(normal.name).to be 'Normal'
    expect(normal.sell_in).to be SELL_IN - 1
    expect(normal.quality).to be QUALITY - 1
  end

  it 'updates passes appropriately, reducing sell_in by 1, increasing quality by 1' do
    expect(pass.name).to start_with 'Backstage'
    expect(pass.sell_in).to be SELL_IN - 1
    expect(pass.quality).to be QUALITY + 1
  end

  it 'updates brie appropriately, reducing sell_in by 1, increasing quality by 1' do
    expect(brie.name).to be 'Aged Brie'
    expect(brie.sell_in).to be SELL_IN - 1
    expect(brie.quality).to be QUALITY + 1
  end

  it 'updates sulfuras appropriately, not changing anything' do
    expect(sulfuras.name).to start_with 'Sulfuras'
    expect(sulfuras.sell_in).to be 'N/A'
    expect(sulfuras.quality).to be 'N/A'
  end

  it 'updates conjured items correctly, reducing sell_in by 1 and quality by 2' do
    expect(conjured.name).to be 'Conjured'
    expect(conjured.sell_in).to be SELL_IN - 1
    expect(conjured.quality).to be QUALITY - 2
  end
end
