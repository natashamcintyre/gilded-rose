# frozen_string_literal: true

require_relative './normal'

# Brie class responsible for updating its quality
class Conjured < Normal
  LOWER_LIMIT = Normal::LOWER_LIMIT

  def initialize(sell_in, quality)
    super('Conjured', sell_in, quality)
  end

  def update_quality
    amount = @sell_in.positive? ? 2 : 4
    decrease_quality_by(amount)
  end
end
