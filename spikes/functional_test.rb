# rspec ./spikes/functional_test.rb

require './zehnk'

require 'capybara'
require 'capybara/dsl'

Capybara.app = Sinatra::Application

RSpec.configure do |config|
  config.include Capybara
end

describe "ZehnK" do

  it "do stuff" do
    visit "/"
    click_link("Reset")
    page.should have_content("Roll")
  end

end