

require 'selenium-webdriver'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')

target = drv.find_element(xpath: "//textarea[@id='comment']")


target.click

puts 'Press ENTER to clear'
gets





for i in 0 .. 10
  drv.action.send_keys(:tab).perform
end

puts 'Press ENTER'
gets

drv.quit
