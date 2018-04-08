

require 'selenium-webdriver'


drv = Selenium::WebDriver.for :chrome


drv.get('https://stark-bastion-95510.herokuapp.com/playground')


cars = drv.find_element(id: 'CarList')


carsList = Selenium::WebDriver::Support::Select.new(cars)

puts "Press ENTER to select Audi"
gets

carsList.select_by(:text, 'Audi')

puts "Press ENTER"
gets

drv.quit
