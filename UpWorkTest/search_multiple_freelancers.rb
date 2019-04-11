require 'selenium-webdriver'
require_relative 'elements.rb'
url = "http://upwork.com"

#define new browser
browser=SiteElement.new(url)

keyword = ['Marco', 'Diego', 'Pablo']
j = 0
while j < keyword.size
  
  browser.cleanCookies()
  browser.navigateto(url)
  #Send keys to freelancers bar
  browser.freelancers_search_bar().send_keys(keyword[j])
  
  browser.wait_for(2)
  #click en search
  browser.search_bnt().click
  
  browser.wait_for(2)
  
  #verify if the search have results displayed
  if browser.results().size > 0
  results = browser.results()
    freelancers = []
    i = 0
    while i < results.size
      freelancers[i] = results[i].find_element(:css, 'div:nth-child(1) > article:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h4:nth-child(2) > a:nth-child(1)').attribute('innerText')
      i = i + 1
    end
  else 
  puts "No results found"
  end
  num = rand(3)
  results[num].click
  freelancer_name = browser.freelancers_name()
  def includes
    if freelancer_name.include?(freelancers[num])
      puts freelancer_name.include?(freelancers[num])
    else  
      puts "The freelancers name are not the same"
    end
    puts freelancer_name + ' - ' + freelancers[num]
  end
  
  browser.backFreelancersList().click
  j = j + 1
end

browser.close_browser