
require 'rspec/expectations'
require 'selenium-webdriver'

require_relative '../pageobjects/loginPage'
require_relative '../pageobjects/forgotPassPage'

describe 'Login' do


  before(:all) do
    @app = LoginPage.new()
  end


  after(:all) do
    @app.quit
  end


  it ('should load signin page') do
    expect(@app.load()).to be(true)
  end

  it('should fill creds') do
    expect(@app.fillForm('elvis', 'graceland')).to be(true)
  end

  describe 'Accessibility' do

    it('should TAB into button') do
      @app.getDriver().action.send_keys(:tab).perform

    end

    it('should have active focus on button') do
      txt = @app.getDriver().switch_to.active_element.attribute('value')
      expect(txt).to eq('Log In')
    end

  end

  describe 'Forgot UserName' do
    let(:pg) { nil }


    it('should goto Forgot Password page') do
      pg = @app.forgotPassword()
      expect(pg).is_a?(ForgotPasswordPage)
      expect(@app.getDriver().title).to match(/Forgot/)

      pg.gotoSandbox()

      expect(@app.getDriver().title).to match(/Login \| Salesforce/)

    end


  end

end