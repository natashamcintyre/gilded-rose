# frozen_string_literal: true

require_relative './normal'

# Brie class responsible for updating its quality
class Brie < Normal
  UPPER_LIMIT = Normal::UPPER_LIMIT

  def initialize(sell_in, quality)
    super('Aged Brie', sell_in, quality)
  end

  def update_quality
    @quality += 1 unless @quality == UPPER_LIMIT
  end
end
