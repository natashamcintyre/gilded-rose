# frozen_string_literal: true

require_relative './item'
require_relative './gilded_rose'
# Brie class responsible for updating its quality
class Sulfuras < Item
  def initialize
    super('Sulfuras, Hand of Ragnaros', 'N/A', 'N/A')
  end
end