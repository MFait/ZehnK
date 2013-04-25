require './spec/helpers'
require './zehnk'
describe 'ZehnK' do

  it { keys_as_integers({'1'=>'on', '2'=>'on'}).should eq([1,2]) }
  it { keys_as_integers(nil).should eq([]) }

end