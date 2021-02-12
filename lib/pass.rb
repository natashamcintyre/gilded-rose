# frozen_string_literal: true

require_relative './normal'
require_relative './gilded_rose'
# Brie class responsible for updating its quality
class Pass < Normal
  UPPER_LIMIT = Normal::UPPER_LIMIT
  # Urgency of Sale Limits
  NOT_URGENT_LIMIT = 11
  URGENT_LIMIT = 6
  # Quality bonuses
  URGENT_BONUS = 2
  VERY_URGENT_BONUS = 3

  def initialize(sell_in, quality)
    super('Backstage passes to a TAFKAL80ETC concert', sell_in, quality)
  end

  def update_quality
    if sell_in >= NOT_URGENT_LIMIT
      increase_quality_by(1)
    elsif sell_in >= URGENT_LIMIT
      increase_quality_by(URGENT_BONUS)
    elsif sell_in >= 0
      increase_quality_by(VERY_URGENT_BONUS)
    else
      @quality = 0
    end
  end

  def increase_quality_by(amount)
    amount.times { @quality += 1 unless @quality == UPPER_LIMIT }
  end
end
