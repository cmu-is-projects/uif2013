Feature: Reading an existing program

Background:
	Given I am logged in as administrator
	Given an initial setup
    Given some programs and events 

		
	Scenario: Reading an existing program
        When I go to "the Soccer page"
        Then show me the page
        Then I should see "Add a Note"
        And I should see "Soccer"
        And I should see "Velit labore ea deleniti sit ipsa aut error eveniet quasi beatae accusamus et voluptates reprehenderit. Adipisci vel corporis repudiandae est. Reprehenderit enim aperiam autem exercitationem aut perferendis dolor eum vel quis rem magnam delectus aliquid alias rerum molestiae debitis"
        # And I should see the button "Back to programs"
        # And I should see the button "Edit this page"
        # And I should see the button "Destroy this program"
    
    Scenario: Return to program page
        When I go to "the Soccer Page"
        Then I should see "Add a Note"
        # Then I should see a button "Back to programs"
        # When I click the button "Back to programs"
        # Then I should see "Current Programs"
        # And I should see "Past Programs"