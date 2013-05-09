require './spec/helpers'

include GameEngine

describe 'Game' do
  let(:game){Game.new}

  it { game.start.table.set.count.should eq(6)}
  it { game.start.pocket.set.count.should eq(0)}

  it 'should be able to roll the dices in the table set' do
    mocked_table_set = double("dice_set")
    mocked_table_set.should_receive(:roll)

    new_game = Game.new.start
    new_game.table.set = mocked_table_set

    new_game.roll
  end

  it {
    new_game = start_game_with([1,2,3]).take([0])

    new_game.table.set.should eq(dice_set_with([2, 3]))
    new_game.pocket.set.should eq(dice_set_with([1]))
  }

  it { game.start.pocket.score.should eq(0) }

  it {
    new_game = start_game_with([1,5,3]).take([0, 1])
    new_game.pocket.score.should eq(150)
  }

  it {
    new_game = start_game_with([3, 3, 3, 5]).take([0, 1, 2, 3])
    new_game.can_bank?.should eq(true)
  }

  it { game.start.bank.amount.should eq(0) }

  it {
    new_game = start_game_with([3, 3, 3, 5]).take([0, 1, 2, 3]).deposit
    new_game.bank.amount.should eq(350)
  }

  it {
    new_game = start_game_with([1, 1, 1, 2]).take([0, 1, 2]).deposit
    new_game.deposit.bank.amount.should eq(1000)
  }

  it {
    new_game = start_game_with([1, 1, 1, 2]).take([0, 1, 2]).deposit
    new_game.pocket.score.should eq(0)
  }

  it 'should reset pocket set after banking' do
    new_game = start_game_with([1, 1, 1, 2]).take([0, 1, 2]).deposit
    new_game.pocket.set.should eq(DiceSet.new)
  end

  it 'should thrown an exception when passed invalid pocket' do
    new_game = start_game_with([1, 1, 1, 2])
    expect{new_game.take([0,3])}.to raise_error()
  end

  it 'should reset pocket and table set if one cant roll again' do
    new_game = start_game_with([1, 5, 3, 2]).roll
    new_game.pocket.set = dice_set_with([1,5])
    new_game.roll

    new_game.pocket.set.should eq(DiceSet.new)
  end

  it 'should track the last called method' do
    start_game_with([1, 5, 3, 2]).roll.last_action.should eq(:roll)
    start_game_with([1, 5, 3, 2]).take([0,1]).last_action.should eq(:take)
  end

  it 'should bank only if last action was pocket' do
    new_game = start_game_with([1, 1, 1, 2]).take([0, 1, 2])
    new_game.roll.deposit
    new_game.bank.amount.should eq(0)
  end

  it 'should reset table set when we roll and last action was pocket and table set is empty' do
    new_game = start_game_with([1, 1, 1, 3, 3, 3]).take([0, 1, 2, 3, 4, 5])
    new_game.roll.table.set.count.should eq(6)

  end

  it 'should reset pocket set when we roll and last action was pocket and table set is empty' do
    new_game = start_game_with([1, 1, 1, 3, 3, 3]).take([0, 1, 2, 3, 4, 5])
    new_game.roll.pocket.set.count.should eq(0)
    new_game.pocket.score.should_not  eq(0)
  end

  it 'should have no players when game starts' do
    Game.new.start.players.count.should eq(0)
  end

  it 'should add players to game' do
    game.start.add(Player.new).players.count.should eq(1)
  end

  it 'should pass its instance to a player' do
    player = Player.new
    game.start.add(player)
    game.should eq(player.game)
  end

  it 'should pick dices from table_set' do
    new_game = start_game_with([1,2,3])

    new_game.pick([0]).should eq(dice_set_with([1]))
    new_game.table.set.should eq(dice_set_with([2, 3]))
  end

  it 'should raise an error for an invalid pick' do
    new_game = start_game_with([1, 1, 1, 2])
    expect{new_game.pick([0,3])}.to raise_error()
  end

end