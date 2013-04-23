class DiceSet

  attr_reader :dices

  def initialize
    @dices = []
  end

  def count
    @dices.count
  end

  def add(dices)
    dices = [dices] unless dices.is_a?(Array)

    dices.each { |dice| @dices << dice }
    self
  end


  def take(indices)
    taken_dice_set = DiceSet.new
    left_dices = []

    self.dices.each_with_index do |_, index|
      indices.include?(index) ? taken_dice_set.add(@dices[index]) : left_dices << @dices[index]
    end

    @dices = left_dices
    taken_dice_set
  end

  def ==(other)
    return false unless self.count == other.count
    self.dices.clone.sort - other.dices.clone.sort == []
  end

  def +(other)
    merged_dices = self.dices.clone.concat(other.dices.clone)
    DiceSet.new.add(merged_dices)
  end

end