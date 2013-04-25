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
    new_game = start_game_with([1,2,3]).pocket([0, 1])

    new_game.table_set.should eq(dice_set_with([3]))
    new_game.pocket_set.should eq(dice_set_with([1,2]))
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
    new_game = start_game_with([1, 1, 1, 2]).pocket([0, 1, 2, 3]).bank
    new_game.bank.banked_amount.should eq(1000)
  }

  it {
    new_game = start_game_with([1, 1, 1, 2]).pocket([0, 1, 2, 3]).bank
    new_game.pocket_score.should eq(0)
  }

end