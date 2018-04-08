

require 'selenium-webdriver'

drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/exercises/fileupload.html')


target = drv.find_element(id: "myFile")
target.send_keys('/private/tmp/data.txt')


puts "Press ENTER"
gets


drv.quit