Feature: Creating a new location

# Background:
#   Given I am logged in as administrator
#   When I visit the page Dashboard
#   And I have clicked on the button Add Location
#   Then I am able to enter my location details
# 
#   
#   Scenario: Name field is missing
#     When I fill in "Name" with ""
#     And I fill in "Street" with "4614 Fifth Avenue"
#     And I fill in "City" with "Pittsburgh"
#     And I fill in "Zip" with "15271"
#     And I click the checkbox "Active"
#     And I click the button "Create Location"
#     Then I should see "can't be blank" next to the "Name" field
# 
#   Scenario: Street field is missing
#     When I fill in "Name" with "Fairfax Apartments"
#     And I fill in "Street" with ""
#     And I fill in "City" with "Pittsburgh"
#     And I fill in "Zip" with "15271"
#     And I click the checkbox "Active"
#     And I click the button "Create Location" 
#     Then I should see "can't be blank" next to the "Street" field
# 
#   Scenario: City field is missing
#     When I fill in "Name" with "Fairfax Apartments"
#     And I fill in "Street" with "4614 Fifth Avenue"
#     And I fill in "City" with ""
#     And I fill in "Zip" with "15271"
#     And I click the checkbox "Active"
#     And I click the button "Create Location" 
#     Then I should see "can't be blank" next to the "City" field
# 
#   Scenario: Zip code is missing
#     When I fill in "Name" with "Fairfax Apartments"
#     And I fill in "Street" with "4614 Fifth Avenue"
#     And I fill in "City" with "Pittsburgh"
#     And I fill in "Zip" with ""
#     And I click the checkbox "Active"
#     And I click the button "Create Location" 
#     Then I should see "should be five digits long" next to the "Zip Code" field 
# 
#   Scenario: Zip code number is too short
#     When I fill in "Name" with "Fairfax Apartments"
#     And I fill in "Street" with "4614 Fifth Avenue"
#     And I fill in "City" with "Pittsburgh"
#     And I fill in "Zip" with "1527"
#     And I click the checkbox "Active"
#     And I click the button "Create Location" 
#     Then I should see "should be five digits long" next to the "Zip Code" field 
# 
#   Scenario: Location has the same name of an existing location
#     When I fill in "Name" with "CMU"
#       And I fill in "Street" with "5000 Forbes Avenue"
#     And I fill in "City" with "Pittsburgh"
#     And I fill in "Zip" with "15271"
#     And I click the checkbox "Active"
#     And I click the button "Create Location" 
#     Then I should see "name is already in use" next to the "Name" field
# 
#   Scenario: Delete old location
#     When I am on on the locations page
#     Then I should see a list of current locations
#     When I click on the location link 'CMU'
#     Then I should see a button "Destroy this location"
#     When I click the button "Destroy this location"
#     Then I should see a javascript message "Are you sure?"
#     And I click "OK"
#     Then I should see a list of locations without "CMU"
# 
#   Scenario: Edit old location
#     When I am on the "CMU" location page
#     And I want to edit a detail
#     Then I click on the button "Edit this location"
#     And after making the change I click the button "Update this location"
#     Then I should the "CMU" location page with the updated changes
# 
#   Scenario: Return to locations page
#     When I am on the "CMU" location page
#     Then I should see a button "Back to locations"
#     When I click the button "Back to locations"
#     Then I should see a list of locations

