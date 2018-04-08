

require 'selenium-webdriver'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')

target = drv.find_element(xpath: "//button[@id='increment']")


target.click

puts 'Press ENTER to clear'
gets





for i in 0 .. 100
  target.click
end

clicksText = drv.find_element(id: 'clicks')

v = clicksText.attribute('text')
puts "Text is " + v
puts 'Press ENTER'
gets

drv.quit
