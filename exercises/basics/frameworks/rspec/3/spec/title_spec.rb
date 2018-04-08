#
# Ru

require 'selenium-webdriver'
require 'rspec/expectations'


describe 'H20Dragon Playground' do

  before(:all) do
    @driver = Selenium::WebDriver.for :chrome
    @driver.get 'https://stark-bastion-95510.herokuapp.com/playground/'
  end

  after(:all) do
    @driver.quit
  end

  it 'should have sign-in title' do

    expect(@driver.title).to match(/H20Dragon Playground/)
  end

  it 'should display username' do
    expect(@driver.find_element(css: '#comment').displayed?).to be(true)
  end

  it 'should display password' do
    expect(@driver.find_element(xpath: "//button[text()='Van Halen']").displayed?).to be(true)
  end


end
