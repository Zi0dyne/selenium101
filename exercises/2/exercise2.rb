


require 'selenium-webdriver'

host = 'http://www.stpcon.com'


drv = Selenium::WebDriver.for :chrome


drv.navigate.to(host)

puts "Title of #{host} is #{drv.title}"



drv.get('http://www.carmax.com')

puts "Title of Carmax site is " + drv.title

drv.navigate.back()


puts "After navigationg back, title is #{drv.title}"


drv.navigate.refresh()

drv.quit()