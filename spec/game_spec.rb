require './spec/helpers'

describe 'Game' do
  let(:game){Game.new}

  it { game.start.table_set.count.should eq(6)}
  it { game.start.pocket_set.count.should eq(0)}

  it 'should be able to roll the dices in the table set' do
    mocked_table_set = double("dice_set")
    mocked_table_set.should_receive(:roll)

    new_game = Game.new.start
    new_game.table_set = mocked_table_set

    new_game.roll
  end

  it 'should pocket dices from the table set' do
    game.start.table_set = dice_set_with([1,2,3])

    game.pocket([0, 1])

    game.table_set.should eq(dice_set_with([3]))
    game.pocket_set.should eq(dice_set_with([1,2]))
  end

  it { game.start.pocket_score.should eq(0) }

  it 'should add score to pocket score' do
    new_game = Game.new.start
    new_game.table_set = dice_set_with([1,5,3])
    new_game.pocket([0,1])
    new_game.pocket_score.should eq(150)
  end

  it 'should check if one can bank' do
    new_game = game.start
    new_game.table_set = dice_set_with([3, 3, 3, 5])
    new_game.pocket([0, 1, 2, 3])
    new_game.can_bank?.should eq(true)
  end

  it { game.start.banked_amount.should eq(0) }

  it 'should be able to bank' do
    new_game = game.start
    new_game.table_set = dice_set_with([3, 3, 3, 5])
    new_game.pocket([0, 1, 2, 3])
    new_game.bank
    new_game.banked_amount.should eq(350)
  end

  it 'should be able to bank three ones' do
    new_game = game.start
    new_game.table_set = dice_set_with([1, 1, 1, 2])
    new_game.pocket([0, 1, 2, 3])
    new_game.bank.banked_amount.should eq(1000)
  end

  it 'should reset pocket score after banking' do

  end

end