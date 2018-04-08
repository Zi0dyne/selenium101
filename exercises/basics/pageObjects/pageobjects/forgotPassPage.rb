
require 'selenium-webdriver'
require_relative '../../../common/utils3'

class ForgotPasswordPage

  attr_accessor :drv
  attr_accessor :un

  def initialize(drv)
    @drv = drv
    @un = { id: 'un'}
  end

  def gotoSandbox()
    getElement(@drv, id: 'sandbox-login').click
  end

  def fillForm(username)
    rc = false
    begin
      getElement(@drv, @un).send_keys(username)
      rc = true
    rescue => ex
      ;
    end
    rc
  end





end