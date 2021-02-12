# frozen_string_literal: true

# class is responsible for updating sell_in dates
class GildedRose
  LOWER_LIMIT = 0
  UPPER_LIMIT = 50

  def initialize(items)
    @items = items
  end

  def update
    @items.each do |item|
      next if item.name == 'Sulfuras, Hand of Ragnaros'

      item.update_quality
      item.sell_in -= 1
    end
  end
end
