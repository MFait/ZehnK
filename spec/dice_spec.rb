require 'rspec'
require './lib/dice'

describe 'Dice' do
  let(:dice){Dice.new}
  it { dice.face.should_not be_nil}

  it 'Should  not be greater than 6' do
    expect{dice.face = 7}.to raise_error(ArgumentError)
    end

  it 'can  be set to a face' do
    dice.face = 6
    expect(dice.face).to eq(6)
  end
end