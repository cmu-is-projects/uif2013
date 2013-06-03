Feature: Reading an existing student

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some students

		
	Scenario: Reading an existing student
        When I go to "the Alex Heimann page"
        Then I should see "Add a Note"
        And I should see "Alexander Heimann"
        And I should see "June 03, 1997"
        And I should see "N/A"
        And I should see "alexander.heimann@yahoo.com"
      # And I should see "5406898984616"
        And I should see "Smith Family (1212 Morewood Avenue)"
        And I should see "Male"
        And I should see "No"
        And I should see "10"
        And I should see "No"
    
    Scenario: Return to student page
        When I go to "the Alex Heimann page"
        Then I should see "Add a Note"
      # When I click on the button "icon-backward  Back to students"
      # Then I should be on "the student index page"