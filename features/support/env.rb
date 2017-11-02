require 'capybara'
require 'capybara/cucumber'
require 'cucumber'
require 'site_prism'
require 'selenium-webdriver'
require 'rspec/expectations'
require 'data_magic'
require 'pry'

require 'show_me_the_cookies'
require_relative 'wait_until_request.rb'


DataMagic.yml_directory = './features/config/data'

$staging_machine_url_login = 'google.com'
$browser_name = 'chrome'
World(ShowMeTheCookies)

Capybara.default_driver = :selenium

if $browser_name == 'firefox'
  Capybara.register_driver :selenium_firefox do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new
    capabilities = Selenium::WebDriver::Remote::Capabilities.firefox
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :desired_capabilities => capabilities,:marionette => true)
    driver = capybara_driver.browser
    wait = Selenium::WebDriver::Wait.new(:timeout => 300)
  end
else
  Capybara.register_driver :selenium do |app|
    options = { :browser => :chrome }
    Capybara::Selenium::Driver.new(app, options)
  end
end
