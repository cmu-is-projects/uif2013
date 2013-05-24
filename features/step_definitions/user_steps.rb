#### SET UP CONTEXTS




#### GIVENS

Given /^a valid admin$/ do
  # TODO: make sure profh user is set up as admin in test db
end

Given /^a logged-in admin$/ do
  step "a valid admin"
  visit new_user_session_path # TODO: verify this is correct path 
  fill_in "Email", :with => "profh@cmu.edu" 
  fill_in "Password", :with => "secret"
  click_button("Log In") # TODO: verify this is button name
end

Given /^an initial setup$/ do
  # TODO: use contexts to create initial setup
  # TODO: consider adding additional setups depending on tests
end


