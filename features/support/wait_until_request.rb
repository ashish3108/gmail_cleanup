BEGIN {p "Wait Until started"}
  module WaitUntilRequest
    def wait_for_active_request
    counter = 0
    p "Waiting for network calls to finish"
    p "*_*"
    retry_count = 0
    driver = Capybara.page.driver
    begin
      while page.execute_script("return jQuery.active").to_i > 0
        counter += 1
        sleep(1)
        raise "AJAX request is taking too long to load on: #{driver.current_url}, retrying once " if counter >= 240
      end
      p "^_^"
    rescue
      if retry_count < 1
        driver.visit(driver.current_url)
        counter = 0
        retry_count += 1
        retry
      end
      p "Unable to load some JS on: #{driver.current_url}"
    end
  end
end

class Object
  include WaitUntilRequest
  extend WaitUntilRequest
end