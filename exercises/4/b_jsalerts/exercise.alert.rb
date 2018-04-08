#
# Reference:
#   URL: https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html


require 'selenium-webdriver'
require_relative '../../common/utils'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')



button = drv.find_element(xpath: "//button[text()='Show Confirm']")
button.click()

puts 'Press ENTER - we will accept the alert'
gets

jsAlert = drv.switch_to.alert
jsAlert.accept


puts 'Press ENTER - we will now cancel the alert'

button.click()
jsAlert.dismiss


puts 'Press ENTER'
gets

drv.quit
