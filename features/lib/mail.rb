class Mail < SitePrism::Page
  element :selected_msg, '.ya.yb'
  elements :label_with_bugs, '.ar.as [title="TravelTriangle_Bug"]'
  element :checkbox, ".J-J5-Ji [role='checkbox']"
  element :loader,'.v1'
  element :toast_msg, '.bofITb'
  element :delete_btn, '[data-tooltip="Delete"]'
  element :delete_forever, '.Bn'
  element :result_sort_btn, '.Dj'
  element :oldest_by_sort, "[id= ':id']"
  elements :sort_result, '.SK.AX .J-N .J-N-Jz'
  element :newer_result, '.amI.T-I-J3'
  element :refresh, '[aria-label="Refresh"]'
  element :empty_trash_link, '.ya .x2'
end