#
# Reference:
#   URL: https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html


require 'selenium-webdriver'
require_relative '../common/utils'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html')

src = drv.find_element(id: 'drag1')

highlight(drv, src, 'red', 5)

target = drv.find_element(id: 'div1')

highlight(drv, target, 'blue', 5)

sleep 0.5

drv.action.drag_and_drop(target, src).perform




puts 'Press ENTER'
gets

drv.quit
