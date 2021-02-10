# frozen_string_literal: true

# Quality class responsible for managing the quality figure of each item
class Quality
  LOWER_LIMIT = 0
  UPPER_LIMIT = 50
  NOT_URGENT_LIMIT = 10
  URGENT_LIMIT = 5
  URGENT_BONUS = 2
  VERY_URGENT_BONUS = 3

  def update(item)
    case item.name
    when 'Aged Brie'
      increase(item)
    when 'Backstage passes to a TAFKAL80ETC concert'
      check_sell_in_and_update(item)
    when 'Conjured'
      decrease(item, 2)
    else
      decrease(item)
    end
  end

  private

  def decrease(item, amount = 1)
    amount *= 2 if item.sell_in <= 0
    item.quality -= amount unless item.quality == LOWER_LIMIT
  end

  def increase(item, amount = 1)
    item.quality += amount unless item.quality == UPPER_LIMIT
  end

  def check_sell_in_and_update(item)
    if item.sell_in > NOT_URGENT_LIMIT
      increase(item)
    elsif item.sell_in > URGENT_LIMIT
      increase(item, URGENT_BONUS)
    elsif item.sell_in.positive?
      increase(item, VERY_URGENT_BONUS)
    else
      item.quality = 0
    end
  end
end
