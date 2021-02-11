# frozen_string_literal: true

# Quality class responsible for managing the quality value of each item
class Quality
  # Set quality value lower and upper limit
  LOWER_LIMIT = 0
  UPPER_LIMIT = 50
  # Set the normal quality change rate
  NORMAL_RATE = 1
  # Set backstage pass sale urgency boundaries (in days).
  NOT_URGENT_LIMIT = 10
  URGENT_LIMIT = 5
  # Set backstage pass quality bonuses
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

  def decrease(item, amount = NORMAL_RATE)
    amount *= 2 if item.sell_in <= 0
    item.quality -= amount unless item.quality == LOWER_LIMIT
  end

  def increase(item, amount = NORMAL_RATE)
    item.quality += amount unless item.quality == UPPER_LIMIT
  end

  def check_sell_in_and_update(item)
    if item.sell_in > NOT_URGENT_LIMIT
      increase(item)
    elsif item.sell_in > URGENT_LIMIT
      increase(item, URGENT_BONUS)
    elsif item.sell_in >= 0
      increase(item, VERY_URGENT_BONUS)
    else
      item.quality = 0
    end
  end
end
