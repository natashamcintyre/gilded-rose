# frozen_string_literal: true

require 'item'
require 'quality'

# class is responsible for updating sell_in dates
class GildedRose
  LOWER_LIMIT = 0
  UPPER_LIMIT = 50
  NOT_URGENT_LIMIT = 10
  URGENT_LIMIT = 5

  def initialize(items)
    @items = items
  end

  def update
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'

      Quality.new(item).update
      item.sell_in -= 1
    end
  end
end
