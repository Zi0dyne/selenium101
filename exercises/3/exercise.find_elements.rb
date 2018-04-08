require 'selenium-webdriver'

require_relative '../common/utils2'

driver = Selenium::WebDriver.for :chrome

driver.get "https://www.porsche.com/usa/modelstart/all/?modelrange=911"

links = nil

begin
  links = driver.find_elements(xpath: '//a')

  i = 0
  links.each do |lnk|
    if lnk.displayed?
      puts "#{i}. #{lnk.text} - #{lnk.attribute('alt')}"
      highlight(driver, lnk, 'blue')
      i+=1
    end

  end
rescue Selenium::WebDriver::Error::TimeOutError
  puts "TIMEOUT - element not found"
rescue => ex
  puts ex.class
ensure
  puts "Total links: " + links.count.to_s
  driver.quit
end