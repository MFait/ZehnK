require 'rspec'
require './lib/dice'

describe 'Dice' do
  let(:dice){Dice.new}
  it { dice.face.should_not be_nil}

  it 'Should  not be greater than 6' do
    expect{dice.face = 7}.to raise_error(ArgumentError)
  end

  it 'should not be less than 1' do
    expect{dice.face = 0}.to raise_error(ArgumentError)
  end

  it 'can  be set to a face' do
    dice.face = 6
    expect(dice.face).to eq(6)
  end

  it 'should be a numeric' do
    expect{dice.face = 1.5}.to raise_error(ArgumentError)
  end

  it 'should roll' do
    Kernel.stub!(:rand).and_return(3)
    expect(dice.roll.face).to eq(4)
  end

  it { expect(Dice.new.face=3).to eq(Dice.new.face =3) }

end