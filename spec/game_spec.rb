require 'rspec'
require './lib/game'

describe 'Game' do
  let(:game){Game.new}

  it { game.start.table_set.count.should eq(6)}
  it { game.start.pocket_set.count.should eq(0)}

  it 'should be able to roll the dices in the table set' do

    #game = game.start
  end
end