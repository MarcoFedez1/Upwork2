require 'selenium-webdriver'
require_relative 'elements.rb'
url = "http://upwork.com"

#define new browser
browser=SiteElement.new(url)

keyword = ['Marco', 'Diego', 'Pablo']
j = 0
while j < keyword.size
  
  browser.cleanCookies()
  puts "1- Navigare to http://upwork.com"
  browser.navigateto(url)
  #Send keys to freelancers bar
  #Send keys to freelancers bar
  puts "2- Click on Free Lancers Bsearch bar"
  puts "3- Enter the keywork for the search"
  browser.freelancers_search_bar().send_keys(keyword[j])
  
  browser.wait_for(2)
  #click en search
  puts "4- Click on search button"
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
  puts "5- Select any freelancers"
  num = rand(3)
  results[num].click
  freelancer_name = browser.freelancers_name()
  def includes
    if freelancer_name.include?(freelancers[num])
      puts freelancer_name.include?(freelancers[num])
    else  
      puts "The freelancers name are not the same"
    end
  end
  puts "The freelancer selected was " +  freelancers[num]
  browser.backFreelancersList().click
  j = j + 1
end

browser.close_browser
