# frozen_string_literal: true

SELL_IN = 15
QUALITY = 10

RSpec.shared_context 'item_doubles', { shared_context: :metadata } do
  let(:brie) { Item.new('Aged Brie', SELL_IN, QUALITY) }
  let(:other) { Item.new('Other', SELL_IN, QUALITY) }
  let(:pass) { Item.new('Backstage passes to a TAFKAL80ETC concert', SELL_IN, QUALITY) }
  let(:sulfuras) { Item.new('Sulfuras, Hand of Ragnaros', SELL_IN, QUALITY) }
  let(:items) { [brie, other, pass, sulfuras] }
end
