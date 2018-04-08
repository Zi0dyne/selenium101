
require_relative '../../../common/utils3'
require_relative './forgotPassPage'

class LoginPage

  attr_accessor :loginUrl

  def initialize
    @loginUrl = 'https://login.salesforce.com/'
    @username = { id: 'username' }
    @password = { id: 'password'}
    @ok = { id: 'Login'}

    @drv = Selenium::WebDriver.for :chrome
    @drv.get 'https://login.salesforce.com/'
  end

  def getDriver()
    @drv
  end

  def load(url = @loginUrl)
    @drv.get(url)
    !@drv.title.match(/Login/).nil?
  end

  def forgotPassword()
    getElement(@drv, id: 'forgot_password_link').click
    ForgotPasswordPage.new(@drv)
  end

  def fillForm(username, password)
    rc = false
    begin
      getElement(@drv, @username).send_keys(username)
      getElement(@drv, @password).send_keys(password)
      rc = true
    rescue => ex
      ;
    end

    rc
  end


  def quit()
    @drv.quit
  end



end