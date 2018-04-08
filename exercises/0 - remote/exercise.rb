require 'selenium-webdriver'


##
# Pre-req.
#   Start Selenium RC Server
#
#  java -jar selenium-standalone-server.jar
#

caps = Selenium::WebDriver::Remote::Capabilities.chrome

drv = Selenium::WebDriver.for :remote,
                              desired_capabilities: caps,
                              url: "http://127.0.0.1:4444/wd/hub"


drv.navigate.to('http://www.stpcon.com')


puts 'press ENTER'
gets


drv.quit
