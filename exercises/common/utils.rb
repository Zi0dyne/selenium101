


require 'selenium-webdriver'


def highlight(drv, element, color = 'red', time = 1)
  orig_style = element.attribute("style")
  drv.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", "border: 2px solid #{color}; color: #{color}; font-weight: bold;")
  if time > 0
    sleep time
    drv.execute_script("arguments[0].setAttribute(arguments[1], arguments[2])", element, "style", orig_style)
  end
end


