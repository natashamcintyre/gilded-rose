# frozen_string_literal: true

require_relative './item'
require_relative './gilded_rose'
# Brie class responsible for updating its quality
class Normal < Item
  LOWER_LIMIT = GildedRose::LOWER_LIMIT
  UPPER_LIMIT = GildedRose::UPPER_LIMIT

  def update_quality
    amount = @sell_in.positive? ? 1 : 2
    decrease_quality_by(amount)
  end

  private
  
  def decrease_quality_by(amount)
    amount.times { @quality -= 1 unless @quality == LOWER_LIMIT }
  end
end
