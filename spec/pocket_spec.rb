require 'rspec'

describe 'Pocket' do
  let(:pocket){Pocket.new}

  it { pocket.score.should eq(0) }
  it { pocket.set.should eq(DiceSet.new) }
  it {pocket.set.count.should eq(0)}

  it 'should reset the set' do
    pocket.set = dice_set_with([1,1,2,3])
    pocket.score = 200
    pocket.reset_only_set
    pocket.set.should eq(DiceSet.new)
    pocket.score.should eq(200)
  end

  it 'should add a set to pocket set' do
    pocket.set = dice_set_with([2,2])
    pocket.add(dice_set_with([1,3]))
    pocket.set.should eq(dice_set_with([2,2,1,3]))
  end

end