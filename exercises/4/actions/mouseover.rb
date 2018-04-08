

require 'selenium-webdriver'

drv = Selenium::WebDriver.for :chrome



drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')


target = drv.find_element(xpath: "//button[text()='Porsche 911 Models']")
drv.action.move_to(target).perform


puts "Press ENTER"
gets


drv.quit