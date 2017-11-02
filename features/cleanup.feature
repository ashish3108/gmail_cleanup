Feature: cleanup traveltriangle bugs
  Background: login user
    Given login as user_1

  @one_time
  Scenario: send to transh and delete
    Given search label label:xyz #enter label here
    #And search for newer_result
    And select all
    And click on delete
    And goto trash page
    And click on delete_forever

  @multiple_times
  Scenario: send to transh and delete in loop
    And delete for 20 times
