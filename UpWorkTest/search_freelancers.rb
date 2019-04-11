require_relative 'elements.rb'


keyword = 'Marco'

  
      #define new browser
  browser=SiteElement.new("http://upwork.com")
  
      #Send keys to freelancers bar
  browser.freelancers_search_bar().send_keys(keyword)
  
      #click en search
  browser.search_bnt().click
  
  browser.wait_for(2)
  
      #verify if the search have results displayed
  if browser.results().size > 0
    results = browser.results()
      i = 0
      freelancers = []
      while i < results.size
        freelancers[i] = results[i].find_element(:css, 'div:nth-child(1) > article:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > h4:nth-child(2) > a:nth-child(1)').attribute('innerText')
        i = i + 1
      end
  else 
    puts "No results found"
  end
  num = rand(3)
  results[num].click
  if (browser.freelancers_name() )
    freelancer_name = browser.freelancers_name()
    def includes
      if freelancer_name.include?(freelancers[num])
        return freelancer_name.include?(freelancers[num])
      else  
        puts "The freelancers name are not the same"
      end
    end
    puts freelancer_name + ' - ' + freelancers[num]
  else
    "The freelancers profile are not available"
  end




browser.close_browser