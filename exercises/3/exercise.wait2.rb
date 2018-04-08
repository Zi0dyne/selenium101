
require 'selenium-webdriver'
require_relative '../common/utils3'


drv = Selenium::WebDriver.for :chrome


drv.navigate.to('https://www.porsche.com/usa/modelstart/all/?modelrange=911')

#getClickable(drv, { id: "m-14-filter-crits"}).click
getClickable(drv, xpath: "//input[@value='coupe']/../span[text()='Coupe']").click

puts 'PRESS ENTER to Continue'
gets

drv.quit