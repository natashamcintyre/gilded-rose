# Gilded Rose

## Spec

"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast\
The Quality of an item is never negative\
“Aged Brie” actually increases in Quality the older it gets\
The Quality of an item is never more than 50\
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality\
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert\
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."

## Breaking the Spec Down

SellIn - number of days to see the item
Quality - how valuable the item is
End of day, both values are lowered.

When SellIn = 0, quality degrades 2*
0 <= Quality <= 50

Special Cases:
Aged Brie - quality INCREASES
Sulfuras - no change to quality, no sellin days
Backstage Passes - quality INCREASES.
  If sellin days <= 10, quality += 2
  If sellin days <= 5, quality += 3
  After concert (sellin days = 0? < 0 ?), quality = 0

Current structure:

Class | Item
-|-
Properties | name, sell_in, quality
Actions | to_s

Class | GildedRose
-|-
Properties | items
Actions | update_quality

What do we want the program to do?
- Check if item is part of "special requirements". If not:
  - Reduce quality by 1 (stop at 0)
  - Reduce sell_in by 1
- else
  - if aged brie, increase quality by 1 (stop at 50) and reduce sell_in by 1
  - if sulfuras, do nothing
  - if backstage passes, increase quality by varying amounts and reduce sell_in by 1
