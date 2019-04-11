require 'selenium-webdriver'
class SiteElement

  def initialize(url)
    @driver=Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.navigate.to url
  end
  
  def navigateto(url)
        @driver.navigate.to url
  end
  def cleanCookies()
    @driver.manage.delete_all_cookies
  end
  #find the search bar by xpath
  def freelancers_search_bar()
    return @driver.find_element(:xpath,'/html/body/div[1]/div[2]/div/nav/div/div[2]/div[1]/form/div[3]/input[2]')
  end
  def search_bnt()
    return@driver.find_element(:css, "div.d-lg-flex > div:nth-child(1) > form:nth-child(1) > div:nth-child(3) > div:nth-child(1) > button:nth-child(1)")
  end
  def results()
    return @driver.find_elements(:xpath, "//*[@id='oContractorResults']/div/div/section")
  end
  def freelancers_name()
    begin
      @driver.find_element(:css, "h2.m-xs-bottom > span:nth-child(1)")
      return @driver.find_element(:css, "h2.m-xs-bottom > span:nth-child(1)").attribute("innerText")
    rescue Selenium::WebDriver::Error::NoSuchElementError
      return false
    end
      return @driver.find_element(:css, "h2.m-xs-bottom > span:nth-child(1)").attribute("innerText")
  end
  def backFreelancersList()
    return @driver.find_element(:css, "button.btn-link:nth-child(1)")
  end
  def isdisplayed?(element)
      element.displayed?
      true
    rescue Selenium::WebDriver::Error::NoSuchElementError
      false
  end
  def wait_for(seconds=5)
    Selenium::WebDriver::Wait.new(:timeout => seconds).until { results() }
  end
  def close_browser()
    @driver.quit
  end
  def equals(one, two)
    if one == two
      return true
    else
      return false
    end
  end
end