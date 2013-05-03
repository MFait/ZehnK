require 'rspec'
require './lib/table'

describe 'Table' do
  let(:table){ Table.new }
  it { table.set.count.should eq(6)}

  it 'should roll set when method roll is called' do
    mocked_set = double('dice_set')
    mocked_set.should_receive(:roll)
    table.set = mocked_set
    table.roll
  end

  it 'should take from set when method take is called' do
    mocked_set = double('dice_set')
    mocked_set.should_receive(:take)
    table.set = mocked_set
    table.take([])
  end

  it 'should check if table is empty' do
    mocked_set = double('dice_set')
    mocked_set.should_receive(:empty?)
    table.set = mocked_set
    table.empty?
  end

  it 'should clone the set' do
    table.set = dice_set_with([1,2,2,2])
    new_table = table.clone
    new_table.set.should eq(dice_set_with([1,2,2,2]))
  end

end