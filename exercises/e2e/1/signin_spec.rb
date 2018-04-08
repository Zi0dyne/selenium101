#
# rspec --format documentation ./signin_spec.rb
#
require 'selenium-webdriver'
require 'rspec/expectations'


describe 'Login' do

  before(:all) do
    puts "[before]: all"

    @drv = Selenium::WebDriver.for :chrome
  end

  after(:all) do
    puts "[after]: all"
    @drv.quit
  end


  describe 'UI' do

    before(:each) do
      puts "[before]: each"
      @drv.get('https://www.carmax.com/mycarmax/sign-in')
    end

    it 'should display username field' do
      expect(@drv.find_element(name: 'email').displayed?).to be(true)
    end

    it 'should display password field' do
      expect(@drv.find_element(name: 'password').displayed?).to be(true)
    end


    it 'should have submit button' do
      expect(@drv.find_element(xpath: "//button[@class='btn' and text()='sign in']").enabled?).to be(true)
    end
  end

  describe 'Forgot Password' do

    before(:all) do
      puts "[before]: all - Forgot Password"
      @drv.get('https://www.carmax.com/mycarmax/sign-in')
    end

    describe 'Forgot password UI' do
      it 'should be returned when clicking forgot link' do
        @drv.find_element(css: '.sign-in--panel--forgot-password>a').click
      end

      it 'should return correct URL' do
        expect(@drv.current_url).to match(/^.*forgot-password/)
      end

      it 'should return correct title' do
        expect(@drv.title).to match(/Forgot Password/)
      end
    end

    describe 'Missing email' do
      before(:all) do
        puts "[before]: all - Missing email"
        @drv.get('https://www.carmax.com/mycarmax/sign-in')
      end

      it 'should click signin button' do
        @drv.find_element(css: '.sign-in--panel--nav > button').click
      end

      it 'should display required email msg' do
        expect(@drv.find_element(xpath: "//span[@class='form--error-message' and text()='Email is required.']").displayed?).to be(true)
      end
    end


  end





end