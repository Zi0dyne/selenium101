#
# Description: Attempt to click on an object that exists, but not visible.
#
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome



driver.get "https://www.porsche.com/usa/modelstart/all/?modelrange=911"

wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
begin
  element = wait.until { driver.find_element(:id => "m-14-filter-crits") }

  # Here, the element "exists", but is not visible - throws an exception"
  element.click

  element = wait.until {driver.find_element(xpath: "//input[@value='coupe']/../span[text()='Coupe']") }
  element.click

  puts "== HIT ENNTER =="
  STDIN.gets
rescue Selenium::WebDriver::Error::TimeOutError
  puts "TIMEOUT - element not found"
rescue => ex
  puts ex.class
ensure
  driver.quit
end
