require 'rspec'

describe 'Bank' do
  let(:bank){Bank.new}
  it {  bank.amount.should eq(0) }
  it {  bank.add(350).amount.should eq(350)}

  it 'should be able to compare banks' do
    bank.should eq(Bank.new)
  end

end