#
# Reference:
#   URL: https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html


require 'selenium-webdriver'
require_relative '../../common/utils'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')



src = drv.find_element(id: 'userid2')


puts 'Press ENTER'
gets

drv.quit
