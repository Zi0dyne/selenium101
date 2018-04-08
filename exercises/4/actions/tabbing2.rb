

require 'selenium-webdriver'

def highlight(drv, element, time = 1)
  orig_style = element.attribute("style")
  drv.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", "border: 2px solid yellow; color: red; font-weight: bold;")
  if time > 0
    sleep time
    drv.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", orig_style)
  end
end


drv = Selenium::WebDriver.for :chrome

drv.navigate.to('https://stark-bastion-95510.herokuapp.com/playground')

target = drv.find_element(xpath: "//textarea[@id='comment']")


target.click

puts 'Press ENTER to clear'
gets





for i in 0 .. 10
  drv.action.send_keys(:tab).perform
  highlight(drv, drv.switch_to.active_element)
end

puts 'Press ENTER'
gets

drv.quit
