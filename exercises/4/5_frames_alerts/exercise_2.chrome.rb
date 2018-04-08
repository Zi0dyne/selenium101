#
# Reference:
#   URL: https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html


require 'selenium-webdriver'
require_relative '../../common/utils'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')


drv.switch_to.frame('elements')

src = drv.find_element(id: 'userid2')

highlight(drv, src, 'green', 5)

src.send_keys("Found you inside frame")

# switch back to the main document
drv.switch_to.default_content

puts 'Press ENTER'
gets

drv.quit
