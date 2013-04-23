require 'rspec'
require './lib/dice_set'
require './lib/dice'

describe 'DiceSet' do

  let(:dice_set){DiceSet.new}

  let(:dice){Dice.new}

  it {dice_set.count.should eq(0)}

  it { dice_set.add(dice).add(dice).count.should eq(2)}

  it { DiceSet.new.add(dice).add(dice).should eq(DiceSet.new.add(dice).add(dice))}

  it { dice_set_with([1,2,3,4]).should eq(dice_set_with([1,2,3,4])) }

  it { dice_set_with([1,2,3,4]).should_not eq(dice_set_with([5,6,1,2])) }

  it 'should add an array of dices to array set' do
    dice_set.add([dice, dice, dice]).count.should eq(3)
  end

  it 'should take dice from diceset' do
    source = dice_set_with([1, 2, 3, 4])
    destination = source.take([0,2])

    destination.should eq(dice_set_with([1, 3]))
    source.should eq(dice_set_with([2,4]))
  end

  it 'should merge dice sets' do
    merged_dice_set = dice_set_with([1,4]) + dice_set_with([3,2])
    merged_dice_set.should eq(dice_set_with([1,4,3,2]))
  end

  it 'should roll the dice in the set' do
     mocked_dice = double("dice")
     mocked_dice.should_receive(:roll)

     dice_set.add(mocked_dice).roll
  end


  #private
  def dice_set_with(faces)
    dice_set = DiceSet.new
    faces.each do |face|
      dice = Dice.new
      dice.face = face
      dice_set.add(dice)
    end
    dice_set
  end

end
