#### SET UP CONTEXTS
# set up profh user
def create_admin_user
  @profh = User.new
  @profh.first_name = "Professor"
  @profh.last_name = "Heimann"
  @profh.username = "profh"
  @profh.email = "profh@cmu.edu"
  @profh.password = "secret"
  @profh.password_confirmation = "secret"
  @profh.role = "admin"
  @profh.active = true
  @profh.save!
end

def create_locations
  @cmu = FactoryGirl.create(:location)
 	@new_jersey = FactoryGirl.create(:location, :name => "Jocelyn's Home", :street => "12 Somewhere Road", :city => "Someplace", :zip => '10000', :active => false)
  @oakland = FactoryGirl.create(:location, :name => "Oakland")
end

def create_departments
  @arts = FactoryGirl.create(:department)
  @athletics = FactoryGirl.create(:department, :name => "Athletics", :description => "Sports")
  @outreach = FactoryGirl.create(:department, :name => "Global Outreach", :description => "Reaching Out", :active => false)
end

def create_arts_programs_and_events
  @choir = FactoryGirl.create(:program, department: @arts)
  @mon_class = FactoryGirl.create(:event, :location => @cmu, :program => @choir)
end

def create_athletic_programs_and_events
  @soccer = FactoryGirl.create(:program, department: @athletics, name: "Soccer", description: "Soccer Intramural Sports", max_grade: 9, min_grade: 6, max_capacity: 75, active: true, start_date: 4.months.ago.to_date, end_date: nil)
  @tues_class = FactoryGirl.create(:event, :location => @cmu, :program => @soccer, :date => 3.days.ago.to_date, :start_time => Time.local(2012,10,3,16,0), :end_time => Time.local(2012,10,3,17,0))
end

def create_outreach_programs_and_events
  @soupkitchen = FactoryGirl.create(:program, department: @outreach, name: "Soup Kitchen", description: "Help nearby soup kitchen serve food", max_grade: 12, min_grade: 4, max_capacity: 50, active: false, start_date: 7.months.ago.to_date, end_date: 2.months.ago.to_date)
  @wed_class = FactoryGirl.create(:event, :location => @cmu, :program => @soupkitchen, :date => 4.days.from_now.to_date, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
  @today_class = FactoryGirl.create(:event, :location => @cmu, :program => @soupkitchen, :date => Date.today, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
end


def create_households
  @smith = FactoryGirl.create(:household)
  @shroot = FactoryGirl.create(:household, :name => "Shroot", :street => "43 New Lane", :city => "New York", :zip => '10540', :active => false)
  @scott = FactoryGirl.create(:household, :name => "Scott", :street => "123 Cool Place", :city => "Scranton", :zip => '48579', :active => true)
end

def create_students
 @alex = FactoryGirl.create(:student, household: @smith)
 @stephany = FactoryGirl.create(:student, household: @shroot, first_name: "Stephany", last_name: "Park", grade: 8, is_male: true)
 @sean = FactoryGirl.create(:student, household: @scott, first_name: "Sean", last_name: "Kumar", grade: 4, is_male: true)
 @amanda = FactoryGirl.create(:student, household:@smith, first_name: "Amanda", last_name: "Works", grade: 6, is_male: false)
end

def create_guardians
	@lsmith = FactoryGirl.create(:guardian, household: @smith)
	@mshroot = FactoryGirl.create(:guardian, household: @shroot, first_name: "Mary", last_name: "Shroot", guardian_type: 'Mother')
  @cscott = FactoryGirl.create(:guardian, household: @scott, first_name: "Clark", last_name: "Scott", cell_phone: "412-222-2222")
end



#### GIVENS

Given /^a valid admin$/ do
  create_admin_user
end

Given /^I am logged in as administrator$/ do
  step "a valid admin"
  visit new_user_session_path # TODO: verify this is correct path 
  fill_in "Login", :with => "profh" 
  fill_in "Password", :with => "secret"
  click_button("Sign in") 
end

Given /^an initial setup$/ do
  create_locations
  create_departments
end

Given /^some programs and events$/ do
  create_arts_programs_and_events
  create_athletic_programs_and_events
  create_outreach_programs_and_events
end

Given /^some households$/ do
  create_households
end


