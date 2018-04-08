#
# Reference:
#   URL: https://stark-bastion-95510.herokuapp.com/exercises/dragdrop.html


require 'selenium-webdriver'
require_relative '../../common/utils'

drv = Selenium::WebDriver.for :firefox

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')


iframe = drv.find_element(xpath: "//iframe[@name='elements']")

drv.switch_to.frame(iframe)

src = drv.find_element(id: 'userid2')

highlight(drv, src, 'green', 5)

src.send_keys("Found you inside frame")

# switch back to the main document
drv.switch_to.default_content

puts 'Press ENTER'
gets

drv.quit
