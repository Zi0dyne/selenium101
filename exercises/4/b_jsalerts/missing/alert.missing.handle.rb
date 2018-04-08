#
# Reference:
#   URL: https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html


require 'selenium-webdriver'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')

alertExists = false
begin
  alert = drv.switch_to.alert
  alertExists = alert.is_a?(Selenium::WebDriver::Alert)

rescue Selenium::WebDriver::Error::NoSuchAlertError
  ;
end

puts "Alert exists : " + alertExists.to_s

drv.quit
