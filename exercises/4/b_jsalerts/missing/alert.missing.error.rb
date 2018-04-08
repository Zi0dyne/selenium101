#
# Reference:
#   URL: https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html


require 'selenium-webdriver'


drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')

jsAlert = drv.switch_to.alert


drv.quit
