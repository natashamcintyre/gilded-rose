# frozen_string_literal: true

require_relative './item'
require_relative './quality'

# class is responsible for updating sell_in dates
class GildedRose
  LOWER_LIMIT = 0
  UPPER_LIMIT = 50
  NOT_URGENT_LIMIT = 10
  URGENT_LIMIT = 5

  def initialize(items, quality_class: Quality)
    @items = items
    @quality = quality_class.new
  end

  def update
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'

      @quality.update(item)
      item.sell_in -= 1
    end
  end
end
