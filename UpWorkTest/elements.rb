require 'selenium-webdriver'
class SiteElement

  def initialize(url)
    @driver=Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.navigate.to url
  end
  #Set a URL to the browser
  def navigateto(url)
        @driver.navigate.to url
  end
  #Clear al cookies
  def cleanCookies()
    @driver.manage.delete_all_cookies
  end
  #find the search bar by xpath
  def freelancers_search_bar()
    return @driver.find_element(:xpath,'/html/body/div[1]/div[2]/div/nav/div/div[2]/div[1]/form/div[3]/input[2]')
  end
  #find the search button by css
  def search_bnt()
    return@driver.find_element(:css, "div.d-lg-flex > div:nth-child(1) > form:nth-child(1) > div:nth-child(3) > div:nth-child(1) > button:nth-child(1)")
  end
  #Get al displayed results for the search by xpath
  def results()
    return @driver.find_elements(:xpath, "//*[@id='oContractorResults']/div/div/section")
  end
  #Get the freelancer selected name
  def freelancers_name()
    begin
      @driver.find_element(:css, "h2.m-xs-bottom > span:nth-child(1)")
      return @driver.find_element(:css, "h2.m-xs-bottom > span:nth-child(1)").attribute("innerText")
    rescue Selenium::WebDriver::Error::NoSuchElementError
      return false
    end
      return @driver.find_element(:css, "h2.m-xs-bottom > span:nth-child(1)").attribute("innerText")
  end
  #Find the "Back to freelancers results" by css
  def backFreelancersList()
    return @driver.find_element(:css, "button.btn-link:nth-child(1)")
  end
  #verify if a element is displayed in the DOM
  def isdisplayed?(element)
      element.displayed?
      true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
  end
  #Set a timeout th the browser
  def wait_for(seconds=5)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { results() }
  end
  #close browser
  def close_browser()
    @driver.quit
  end
end
