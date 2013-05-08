require 'rspec'

describe 'Player' do
  let(:player){GameEngine::Player.new}

  it 'should have a pocket' do
    player.pocket.should eq(Pocket.new)
  end

end