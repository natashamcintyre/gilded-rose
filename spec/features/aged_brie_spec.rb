# frozen_string_literal: true

require 'gilded_rose'

# Feature test
describe GildedRose do
  include_context 'items'
  subject { described_class.new(items) }

  it 'updates normal items appropriately, reducing quality and sell_in by 1' do
    subject.update
    expect(normal.name).to be 'normal'
    expect(normal.sell_in).to be SELL_IN - 1
    expect(normal.quality).to be QUALITY - 1
  end

  it 'updates passes appropriately, reducing sell_in by 1, increasing quality by 1' do
    subject.update
    expect(pass.name).to start_with 'Backstage'
    expect(pass.sell_in).to be SELL_IN - 1
    expect(pass.quality).to be QUALITY + 1
  end

  it 'updates brie appropriately, reducing sell_in by 1, increasing quality by 1' do
    subject.update
    expect(brie.name).to be 'Aged Brie'
    expect(brie.sell_in).to be SELL_IN - 1
    expect(brie.quality).to be QUALITY + 1
  end

  it 'updates sulfuras appropriately, not changing anything' do
    subject.update
    expect(sulfuras.name).to start_with 'Sulfuras'
    expect(sulfuras.sell_in).to be SELL_IN
    expect(sulfuras.quality).to be QUALITY
  end

  it 'updates conjured items correctly, reducing sell_in by 1 and quality by 2' do
    subject.update
    expect(conjured.name).to be 'Conjured'
    expect(conjured.sell_in).to be SELL_IN - 1
    expect(conjured.quality).to be QUALITY - 2
  end
end
