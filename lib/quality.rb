# frozen_string_literal: true

# Quality class responsible for managing the quality figure of each item
class Quality
  LOWER_LIMIT = 0
  UPPER_LIMIT = 50
  NOT_URGENT_LIMIT = 10
  URGENT_LIMIT = 5

  def initialize(item)
    @item = item
  end

  def update
    case @item.name
    when 'Aged Brie'
      increase
    when 'Backstage passes to a TAFKAL80ETC concert'
      check_pass_sell_in_and_update_quality
    else
      decrease
    end
  end

  private

  def decrease(amount = 1)
    amount = 2 if @item.sell_in <= 0
    @item.quality -= amount unless @item.quality == LOWER_LIMIT
  end

  def increase(amount = 1)
    @item.quality += amount unless @item.quality == UPPER_LIMIT
  end

  def check_pass_sell_in_and_update_quality
    if @item.sell_in > NOT_URGENT_LIMIT
      increase
    elsif @item.sell_in > URGENT_LIMIT
      increase(2)
    elsif @item.sell_in.positive?
      increase(3)
    else
      @item.quality = 0
    end
  end
end
