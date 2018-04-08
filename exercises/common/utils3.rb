


require 'selenium-webdriver'


def highlight(drv, element, color = 'red', time = 1)
  orig_style = element.attribute("style")
  drv.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", "border: 2px solid #{color}; color: #{color}; font-weight: bold;")
  if time > 0
    sleep time
    drv.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", orig_style)
  end
end

#
# See Exercise 4/b_jsalerts/alert.missing.handle.rb
#
def alertPresent?(drv)
  alertExists = false
  begin
    alert = drv.switch_to.alert
    alertExists = alert.is_a?(Selenium::WebDriver::Alert)

  rescue Selenium::WebDriver::Error::NoSuchAlertError
    ;
  end

  alertExists
end


def getClickable(drv, locator, timeout = 15)
  wait = Selenium::WebDriver::Wait.new(:timeout => timeout)

  element = wait.until { drv.find_element(locator) }
  wait.until { element.displayed? }
  wait.until { element.enabled? }

  return element
end

def getElement(drv, locator, timeout = 10)
  getClickable(drv, locator, timeout)
end
