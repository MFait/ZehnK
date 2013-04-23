require 'rspec'
require './lib/dice_set'
require './lib/dice'

describe 'DiceSet' do

  let(:dice_set){DiceSet.new}

  let(:dice){Dice.new}

  it {dice_set.count.should eq(0)}

  it{ dice_set.add(dice).add(dice).count.should eq(2)}

  it 'should compare equality of two dice sets'do
     DiceSet.new.add(dice).add(dice).should eq(DiceSet.new.add(dice).add(dice))
  end

  #it 'should take dice from diceset' do
  #  dice_set.add(dice.roll).add(dice.roll).add(dice.roll)
  #  taken_dice_set = dice_set.take([1,2])
  #  taken_dice_set.count.should eq(2)
  #  dice_set.count.should eq(1)
  #end
end
