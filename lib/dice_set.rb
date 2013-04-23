class DiceSet

  def initialize
    @dices = []
  end

  def count
    @dices.count
  end

  def add(dice)
    @dices << dice
    self
  end

  #def take(dice_indicies)
  #  taken_dice_set = DiceSet.new
  #  dice_indicies.each do |index|
  #    taken_dice_set.add(@dices[index])
  #    @dices.delete_at(index)
  #  end
  #  taken_dice_set
  #end
  def ==(other)
    self.count == other.count
  end

end