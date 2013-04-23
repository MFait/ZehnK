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
    initial_table_set = dice_set_with([1,2,3])
    game.start.table_set = initial_table_set

    game.pocket([0, 1])

    game.table_set.should eq(dice_set_with([3]))
    game.pocket_set.should eq(dice_set_with([1,2]))
  end

end