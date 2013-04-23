require 'rspec'
require './lib/game'

describe 'Game' do
  let(:game){Game.new}

  it 'should have six dice in table_set and should have none in pocket set' do
    game.start.table_set.count.should eq(6)
    game.start.pocket_set.count.should eq(0)
  end
end