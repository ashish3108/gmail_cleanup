# gmail_cleanup
clean up specific labels in gmail

1. Setup:
Rails -> 2.0 >
gems required -> "
                  require 'capybara'
                  require 'capybara/cucumber'
                  require 'cucumber'
                  require 'site_prism'
                  require 'selenium-webdriver'
                  require 'rspec/expectations'
                  require 'data_magic'
                  require 'pry'
               "
2. Open cleanup.rb -> 
  1. Line 3 enter gmail user_name
  2. Line 6 enter gmail password
  Optional:
  remove line 8, if google is able to login without captch code or you have two step login
  just once its in gmail page, enter exit in console to proceed with script
  Save and exit file

3. Open cleanup.feature
  1. Edit line 7, search label "enter the label which is to be delete, without double quotes"
  Save and exit file
  
4. goto console type:
  cucumber -t @multiple_times 
  
  
