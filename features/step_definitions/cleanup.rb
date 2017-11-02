When(/^login as user_1$/) do
  visit 'gmail'
  find('#identifierId').set 'ashish.tripathi@traveltriangle.com' #gmail username here
  find('#identifierNext').click
  sleep 5
  find("#password [type = 'password']").set 'o822s1oo2o' #password here
  find('#passwordNext').click
  binding.pry
end

When(/^search label (.*)$/) do |label|
  p "Search Label"
  @mail_page = Mail.new
  has_css? ('#gbqfq')
  find('#gbqfq').set label
  find('#gbqfq').send_keys :enter
  sleep 15
  # @mail_page.wait_until_loader_invisible 30
  @mail_page.wait_until_result_sort_btn_visible 10
  @mail_page.result_sort_btn.click
  @mail_page.sort_result.last.click
  sleep 5
  @mail_page.wait_until_newer_result_visible 30
  @mail_page.newer_result.click
  sleep 5
  begin
    @mail_page.wait_until_loader_invisible 30
  rescue
    p "Error!! unable to find loader"
  end
  p "Search Label done!!!!"
end


When(/^select all$/) do
  p "Select all mails"
  # @mail_page.wait_until_label_with_bugs_visible 30
  @mail_page.wait_until_checkbox_visible 30
  @mail_page.checkbox.click
  sleep 5
  @mail_page.wait_until_loader_invisible 30
  p "Select all mails done!!"
end


When(/^click on (.*)$/) do |cta|
  if cta == 'delete'
    p "Tyring to delete labels"
    begin
      p "begin of label delete"
      @mail_page.wait_until_delete_btn_visible 30
    rescue
      p "rescue of label delete"
      steps %Q{
        And select all
      }
      sleep 3
    end
    @mail_page.delete_btn.click
    sleep 15
    p "label deleted"
    # @mail_page.wait_until_loader_invisible 30
  elsif cta == 'delete_forever'
    p "trying to delete from trash"
    retry_ct = 0
    begin
      @mail_page.empty_trash_link.click
    rescue
      p "in rescue: trash delete link not available"
      if retry_ct < 1
        find('#gbqfq').send_keys :enter
        sleep 5
        retry_ct += 1
        retry
      end
    end
    sleep 3
    find_button('OK').click
    sleep 10
    p "deleted from trash done!!!"
  end
end

When(/^goto trash page$/) do
  p "going to trash page"
  has_css? ('#gbqfq')
  find('#gbqfq').set 'in:trash'
  find('#gbqfq').send_keys :enter
  sleep 10
  p "on trash page"
end

When(/^delete for (.*) times$/) do |loop|
  loop = loop.to_i
  count = 0
  loop.times do
    5.times do
      steps %Q{
                And search label label:traveltriangle_bug
                And select all
                And click on delete
              }
    sleep 5
    end
    steps %Q{
              And goto trash page
              And click on delete_forever
            }
    count += 1
    p "Done #{count} times"
  end
  p "All Done: #{loop} times"
end



