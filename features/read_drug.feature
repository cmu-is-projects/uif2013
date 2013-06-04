Feature: Reading an existing program

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some drugs

		
	Scenario: Reading an existing drug
        When I go to "the Motrin page"
        Then I should see "Add a Note"
        And I should see "Motrin"
        And I should see "Soccer Intramural Sports"
        And I should see "true"
        And I should see "true"
    
    Scenario: Return to drug page
        When I go to "the Motrin page"
        Then I should see "Add a Note"
      # When I click on the button "icon-backward  Back to drugs"
      # Then I should see "Drug Listing"
