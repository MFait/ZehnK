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

  it {
    new_game = start_game_with([1,2,3]).pocket([0])

    new_game.table_set.should eq(dice_set_with([2, 3]))
    new_game.pocket_set.should eq(dice_set_with([1]))
  }

  it { game.start.pocket_score.should eq(0) }

  it {
    new_game = start_game_with([1,5,3]).pocket([0, 1])
    new_game.pocket_score.should eq(150)
  }

  it {
    new_game = start_game_with([3, 3, 3, 5]).pocket([0, 1, 2, 3])
    new_game.can_bank?.should eq(true)
  }

  it { game.start.banked_amount.should eq(0) }

  it {
    new_game = start_game_with([3, 3, 3, 5]).pocket([0, 1, 2, 3]).bank
    new_game.banked_amount.should eq(350)
  }

  it {
    new_game = start_game_with([1, 1, 1, 2]).pocket([0, 1, 2]).bank
    new_game.bank.banked_amount.should eq(1000)
  }

  it {
    new_game = start_game_with([1, 1, 1, 2]).pocket([0, 1, 2]).bank
    new_game.pocket_score.should eq(0)
  }

  it 'should reset pocket set after banking' do
    new_game = start_game_with([1, 1, 1, 2]).pocket([0, 1, 2]).bank
    new_game.pocket_set.should eq(DiceSet.new)
  end

  it 'should thrown an exception when passed invalid pocket' do
    new_game = start_game_with([1, 1, 1, 2])
    expect{new_game.pocket([0,3])}.to raise_error()
  end

  it 'should reset pocket and table set if one cant roll again' do
    new_game = start_game_with([1, 5, 3, 2]).roll
    new_game.pocket_set = dice_set_with([1,5])
    new_game.roll

    new_game.pocket_set.should eq(DiceSet.new)
  end

  it 'should track the last called method' do
    start_game_with([1, 5, 3, 2]).roll.last_action.should eq(:roll)
    start_game_with([1, 5, 3, 2]).pocket([0,1]).last_action.should eq(:pocket)
  end

  it 'should bank only if last action was pocket' do
    new_game = start_game_with([1, 1, 1, 2]).pocket([0, 1, 2])
    new_game.roll.bank
    new_game.banked_amount.should eq(0)
  end


end