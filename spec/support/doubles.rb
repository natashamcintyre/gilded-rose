# frozen_string_literal: true

require 'item'

SELL_IN = 15
QUALITY = 10

RSpec.shared_context 'items', { shared_context: :metadata } do
  let(:brie) { Item.new('Aged Brie', SELL_IN, QUALITY) }
  let(:normal) { Item.new('normal', SELL_IN, QUALITY) }
  let(:pass) { Item.new('Backstage passes to a TAFKAL80ETC concert', SELL_IN, QUALITY) }
  let(:sulfuras) { Item.new('Sulfuras, Hand of Ragnaros', SELL_IN, QUALITY) }
  let(:conjured) { Item.new('Conjured', SELL_IN, QUALITY) }
  let(:items) { [normal, brie, pass, sulfuras, conjured] }
end

RSpec.shared_context 'item_quality_double', { shared_context: :metadata } do
  let(:quality_manager) { double :quality_manager, update: true }
  let(:quality_class_double) { double :quality_class, new: quality_manager }
end
