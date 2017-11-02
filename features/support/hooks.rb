Before do | scenario |
  Capybara.current_driver = :selenium
  # @app_host = $staging_machine_url
  @app_host = "http://www.#{$staging_machine_url_login}/"
  Capybara.app_host = @app_host
  @wait = Selenium::WebDriver::Wait.new timeout: 240
  @driver = page.driver
  @wait.until { page.driver.browser.manage.window }
  page.driver.browser.manage.window.maximize
end

After do | scenario |
  p "in after callback.."
  # p scenario.methods
  if scenario.failed?
    filename = "#{FAILED_DIR_PATH}/failed--#{scenario.location.file.gsub("features/","").gsub("/","-")}--#{scenario.location.line}.html"
    Capybara.save_page filename
    p "scenario has been failed...!!"
    Capybara::Screenshot.screenshot_and_save_page
  elsif scenario.passed?
    p "scenario has been passed..!!"
  end
  page.driver.quit
end

