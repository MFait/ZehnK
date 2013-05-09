require './spec/helpers'

describe 'Player' do
  let(:player){GameEngine::Player.new}

  it 'should have a pocket' do
    player.pocket.should eq(Pocket.new)
  end

  it 'should pick dice' do
    mocked_game = double('GameEngine::Game')
    player.game = mocked_game
    mocked_game.should_receive(:pick).with([0, 1, 2]).and_return(dice_set_with([1]))
    player.play(:pick, [0, 1, 2])
  end

  it 'should add to pocket on player pick' do
    game = start_game_with([1, 2, 3])
    game.add(player)
    player.play(:pick, [0])
    player.pocket.score.should eq(100)
  end

  it 'should roll dice' do
    mocked_game = double('GameEngine::Game')
    player.game = mocked_game
    mocked_game.should_receive(:roll)
    player.play(:roll)
  end

  it 'should have a bank' do
    player.bank.should eq(Bank.new)
  end

  it 'should check if player can bank' do
    start_game_with([1, 1, 1]).add(player)
    player.play(:pick, [0, 1, 2])

    player.can_bank?.should eq(true)
  end

  it 'should check if player can not bank' do
    start_game_with([1, 1, 1]).add(player)
    player.play(:pick, [0])

    player.can_bank?.should eq(false)
  end

  it 'should only bank if last action was :pick' do
    start_game_with([1, 1, 1]).add(player)
    player.play(:pick, [0, 1, 2]).play(:roll)

    player.can_bank?.should eq(false)
  end

  it 'should track the last action' do
    start_game_with([1, 1, 1]).add(player)
    player.play(:pick, [0])

    player.last_action.should eq(:pick)
  end

  it 'should be possible to bank' do
    start_game_with([1, 1, 1]).add(player)
    player.play(:pick, [0, 1, 2]).play(:bank)

    player.bank.amount.should eq(1000)
  end

  it 'should only bank if the player can bank' do
    start_game_with([1, 1]).add(player)
    player.play(:pick, [0, 1]).play(:bank)

    player.bank.amount.should_not eq(200)
  end

  it 'should reset pocket after banking' do
    start_game_with([1, 1, 1]).add(player)
    player.play(:pick, [0, 1, 2]).play(:bank)

    player.pocket.score.should eq(0)
  end

  it 'should reset the game table set after banking' do
    mocked_game = double('GameEngine::Game')
    player.game = mocked_game
    mocked_game.should_receive(:reset_table)

    player.last_action = :pick
    player.pocket.score = 400
    player.deposit

  end

end