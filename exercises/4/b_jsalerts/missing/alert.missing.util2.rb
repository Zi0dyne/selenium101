#
# Reference: /common/utils2
#
require 'selenium-webdriver'
require '../../../../exercises/common/utils2'


drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')


puts "Alert exists : " + alertPresent?(drv).to_s

drv.quit
