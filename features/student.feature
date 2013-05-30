Feature: Creating a new student

# Background:
#   Given I am logged in as administrator
#   When I visit the page Dashboard
#   And I have clicked on the button Add Student
#   And I am able to enter my student details
# 
#     
#   Scenario: First name field is missing
#       When I fill in "First name" with ""
#       And I fill in "Last name" with "Washington"
#     And I fill in "Barcode number" with "38674854"
#     And I select "3" under the "Grade" field
#     And I click the button "Create Student" 
#     Then I should see "can't be blank" next to the "First name" field
# 
#   Scenario: Last name field is missing
#       When I fill in "First name" with "George"
#       And I fill in "Last name" with ""
#     And I fill in "Barcode number" with "38674854"
#     And I select "3" under the "Grade" field
#     And I click the button "Create Student" 
#     Then I should see "can't be blank" next to the "Last name" field
# 
#   Scenario: Barcode number field is missing
#       When I fill in "First name" with "George"
#       And I fill in "Last name" with "Washington"
#     And I fill in "Barcode number" with ""
#     And I select "3" under the "Grade" field
#     And I click the button "Create Student" 
#     Then I should see "can't be blank" next to the "Barcode number" field
# 
#     Scenario: Barcode number field is in an improper format
#       When I fill in "First name" with "George"
#       And I fill in "Last name" with "Washington"
#     And I fill in "Barcode number" with "verywrong"
#     And I select "3" under the "Grade" field
#     And I click the button "Create Student" 
#     Then I should see "should be 12 digits" next to the "Barcode number" field
# 
#   Scenario: Grade field is missing
#       When I fill in "First name" with "George"
#       And I fill in "Last name" with "Washington"
#     And I fill in "Barcode number" with "38674854"
#     And I select "" under the "Grade" field
#     And I click the button "Create Program" 
#     Then I should see "can't be blank" next to the "Grade" field
# 
#   Scenario: Cell phone number is in an improper format
#     When I fill in "First name" with "George"
#       And I fill in "Last name" with "Washington"
#     And I fill in "Barcode number" with "38674854"
#     And I select "3" under the "Grade" field
#     And I fill in "Cell phone" with "395kdrs"
#     And I click the button "Create Program" 
#     Then I should see "should be 10 digits (area code needed) and delimited with dashes or spaces only" next to the "Cell phone" field
# 
#   Scenario: Email is in an improper format
#     When I fill in "First name" with "George"
#       And I fill in "Last name" with "Washington"
#     And I fill in "Barcode number" with "38674854"
#     And I select "3" under the "Grade" field
#     And I click the button "Create Program" 
#     Then I should see "is not a valid format" next to the "Email" field
# 
#   Scenario: Does not see barcode when it is a visitor
#     When I fill in "First name" with "George"
#       And I fill in "Last name" with "Washington"
#     And I fill in "Barcode number" with "38674854"
#     And I select "3" under the "Grade" field
#     And I select the checkbox "Is visitor" 
#     Then I should not see the "Barcode number" field
#     But I should see "Visitor Information"
#     And "Family name"
#     And "Street"
#     And "Street2"
#     And "Zip"
# 
#   Scenario: Generate barcode
#     When I click on the student link "Heimann, Alex"
#     And I select the button "Generate barcode (PDF)"
#     Then I should see a downloaded file called "#{Barcode number}.pdf"
# 
# # There is no option to delete a student
#   #Scenario: Delete a student
#   # When I am on on the students page
#   # Then I should see a list of regular students
#   # When I click on the program link 'Heimann, Alex'
#   # Then I should see a button "Destroy this student"
#   # When I click the button "Destroy this student"
#   # Then I should see a javascript message "Are you sure?"
#   # And I click "OK"
#   # Then I should see a list of students without "Heimann, Alex"
# 
#   Scenario: Edit existing student
#     When I am on the "Heimann, Alex" student page
#     And I want to edit a detail
#     Then I click on the button "Edit this student"
#     And after making the change I click the button "Update this student"
#     Then I should the "Heimann, Alex" student page with the updated changes
# 
#   Scenario: Return to regular students page
#     When I am on the "Alex Heimann" student page
#     Then I should see a button "Back to students"
#     When I click the button "Back to students"
#     Then I should see a list of students
# 
# 
