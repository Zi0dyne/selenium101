require 'selenium-webdriver'
require 'rspec/expectations'
require 'headless'

MAX_RETRIES = 3
MAX_TIMEOUT = 8

testData = { :host => ENV['TEST_HOST'], :role => ENV['TEST_ROLE'] }


def wait_for_displayed(drv, locator, _retries = MAX_RETRIES, _timeout = MAX_TIMEOUT)
      rc=nil

      _retries.times { |i|
        begin
          rc = Selenium::WebDriver::Wait.new(timeout: _timeout).until { rc=drv.find_element(locator).displayed? }

        rescue Selenium::WebDriver::Error::StaleElementReferenceError => ex
          ;
        rescue Selenium::WebDriver::Error::TimeOutError => ex
          puts ".. retry #{i} - #{locator}"
        end
      }
      rc
end


def wait_for_not_displayed(drv, locator)
  rc = wait_for_displayed(drv, locator, 1)
  rc.nil?
end

describe "Signin #{testData[:host]}" do

  let(:host)   { ENV['TEST_HOST'] }
  let(:expected_expense_url) { "#{testData[:host]}/Expense/Client/default.asp" }
  let(:expected_travel_url)  { "#{testData[:host]}/travelhome.asp" }

  before(:all) do
    @headless = Headless.new
    @headless.start
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:all) do
    @driver.quit
    @headless.destroy
  end


  describe "Load URL" do
    it 'should have correct sign-in title' do
      @driver.get "#{host}"
      expect(@driver.title).to match(/^Sign in to Concur \| Concur Solutions$/)
    end
  end


  describe "Footer" do
    it 'should display footer' do
      expect(wait_for_displayed(@driver, { :css => '.container.cnqr-app-footer' })).to be(true)
    end
  end


  describe "Login Form UI" do

    it 'should display Forgot your user name link' do
      expect(@driver.find_element(:xpath => "//div[@id='sidebar1']//a[text()='Forgot your user name?']").displayed?).to be(true)
    end

    describe 'Remember checkbox' do
      it 'should display Remember user name on this computer checkbox is not checked by default' do
        expect(wait_for_displayed(@driver, {:css => '#rememberLogin'} )).to be(true)
      end

      it 'should not be selected by default' do
        expect(@driver.find_element(:css => '#rememberLogin').selected?).to be(false)
      end
    end

    it 'should display Forgot your user password link' do
      expect(@driver.find_element(:xpath => "//div[@id='sidebar1']//a[text()='Forgot your password?']").displayed?).to be(true)
    end

    it 'should display language selection' do
      expect(@driver.find_element(:css => '#selectLang').displayed?).to be(true)
    end

  end  # Login Form UI


  describe 'User login' do
    let(:userid) { ENV['TEST_USERID'] }
    let(:passwd) { ENV['TEST_PASSWD'] }

    it 'should enter login form' do
      useridObj=@driver.find_element(:css, '#userid')
      useridObj.send_keys(userid)

      passObj=@driver.find_element(:css, '#password')
      passObj.send_keys(passwd)

      expect(useridObj.displayed? && passObj.displayed?).to be(true)
    end

    it 'should click login button' do
      ok=@driver.find_element(:css, '#btnSubmit')
      ok.click
    end

  end


  describe 'On successful login' do

    describe 'Landing page' do
      it "should return landing page #{testData[:host]}/home.asp" do
         expect(@driver.current_url.end_with?("#{testData[:host]}/home.asp")).to be(true)
      end

      it 'should show help link' do 
        locator={ :xpath => '//li[contains(@class, "dropdown cnqr-nav-help")]' }
        expect(wait_for_displayed(@driver, locator)).to be(true)
      end

      it 'should show profile img' do 
        locator = { :css => '.cnqr-profile-img-avatar'}
        expect(wait_for_displayed(@driver, locator)).to be(true)
      end

      it 'should show profile menu link' do 
        locator = { :css => '#cnqr-profile-menu-link'}
        expect(wait_for_displayed(@driver, locator)).to be(true)
      end


      describe "Quicktasks" do
        it 'should display Quick tasks' do
          expect(wait_for_displayed(@driver, {:css => '#quicktasks' } )).to be(true)
        end
      end

    end


    describe "#{testData[:role]} role" do

      if testData[:role].match(/travel/i)
        it "should show Travel Wizard" do

          if testData[:role].match(/travel/i)
            expect(wait_for_displayed(@driver, { :css => '.cnqr-travelwidget' } )).to be(true)
          else
           pending "Unknown role"
          end
        end

        it "should show Travel Policy link" do
          expect(wait_for_displayed(@driver, { :xpath => "//div[@class='container cnqr-app-footer']//a[text()='Travel Policy']" })).to be(true)
        end

      elsif testData[:role].match(/expense/i)
        it "expense should not have travel widget" do
          expect(wait_for_not_displayed(@driver, { :css => '.cnqr-travelwidget' } )).to be(true)
        end
      end

    end


    describe 'Travel Role Navigation' do
       pending "Disabled for non-Travel role" unless testData[:role].match(/travel/i)
       before {  skip } unless testData[:role].match(/travel/i)

       it 'should click Travel menu item' do
          @driver.find_element(:css => "li[class='cnqr-nav-travel ']").click
       end

       it "should have Travel URL" do
         expect(@driver.current_url).to eq(expected_travel_url)
       end


       it 'should have travel wizard' do
         expect(wait_for_displayed(@driver, { :css => '.cnqr-travelwidget' })).to be(true)
       end

    end


    describe 'Expense Role Navigation' do
       pending "Disabled for non-Expense role" unless testData[:role].match(/expense/i)
       before {  skip } unless testData[:role].match(/expense/i)


       it 'should not have have Travel Wizard' do
         expect(!testData[:role].match(/expense/i).nil?).to be(true)
       end

       describe 'should navigate to Expense page' do
          pending "N/A for non-Expense role" unless testData[:role].match(/expense/i)

          it 'should click Expense menu item' do
             @driver.find_element(:css => "li[class='cnqr-nav-expense ']").click
          end

          it "should have Expense URL" do
            expect(@driver.current_url).to eq(expected_expense_url)
          end
           

       end

    end

  end
end
