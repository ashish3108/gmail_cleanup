BEGIN {p "New tab Switch Started"}
  module NewtabSwitchOnOff
    @@current_id = nil
    def open_switch_new_tab
      browser = page.driver.browser
      @@current_id = browser.window_handle
      page.driver.open_new_window
      switch_to_window windows.last
    end

    def close_and_switch_last_tab
      browser = page.driver.browser
      page.driver.browser.close
      browser.switch_to.window @@current_id
      @@current_id = nil
    end
  end

class Object
  include NewtabSwitchOnOff
  extend NewtabSwitchOnOff
end