

require 'selenium-webdriver'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')

target = drv.find_element(css: "div[class='container'] > .form-group > #comment")


target.send_keys('Demystifying Selenium Workshop 2018')

puts 'Press ENTER to clear'
gets


target.clear


target.send_keys('DCAST 2018')

puts 'Press ENTER'
gets

drv.quit
