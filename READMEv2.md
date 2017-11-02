# Gmail_cleanup<br />
clean up specific labels in gmail<br />

1. Setup: <br />
Rails -> 2.0 > <br />
gems required -> " <br />
                  'capybara'<br />
                  'capybara/cucumber'<br />
                  'cucumber'<br />
                  'site_prism'<br />
                  'selenium-webdriver'<br />
                  'rspec/expectations'<br />
                  'data_magic'<br />
                  'pry'<br />

2. Open cleanup.rb -> <br />
  a. Line 3 enter gmail user_name <br />
  b. Line 6 enter gmail password <br />
  Optional: <br />
  remove line 8, if google is able to login without captch code or you have two step login <br />
  Once on gmail page, enter exit in console to proceed with script <br />
  Save and exit file <br />

3. Open cleanup.feature <br />
  a. Edit line 7, search label "enter the label which is to be delete, without double quotes" <br />
  Save and exit file <br />
  
4. goto console type and hit enter: <br />
  cucumber -t @multiple_times <br />
  
  
