
#
# Objective:  Open a browser (creates a session) and navigate to a specific URL, then obtain the title and current URL.
#
require 'selenium-webdriver'


drv = Selenium::WebDriver.for :chrome

puts "WebDriver object is " + drv.class.to_s


drv.navigate.to('http://www.stpcon.com')

title = drv.title
url = drv.current_url


puts "Current Title is " + title
puts "Current URL is " + url


drv.quit
