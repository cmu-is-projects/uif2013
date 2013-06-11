require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
 # Add more helper methods to be used by all tests here...
  def deny(condition)
    # a simple transformation to increase readability IMO
    assert !condition
  end
  
 # Context for departments
  def create_department_context
    @arts = FactoryGirl.create(:department)
    @athletics = FactoryGirl.create(:department, :name => "Athletics", :description => "Sports")
    @outreach = FactoryGirl.create(:department, :name => "Global Outreach", :description => "Reaching Out", :active => false)
  end
  
  def remove_department_context
    @arts.destroy
    @athletics.destroy
    @outreach.destroy
  end
  
 # Context for events
  def create_event_context
    @mon_class = FactoryGirl.create(:event, :location => @cmu, :program => @choir)
    @tues_class = FactoryGirl.create(:event, :location => @cmu, :program => @soccer, :date => 3.days.ago.to_date, :start_time => Time.local(2012,10,3,16,0), :end_time => Time.local(2012,10,3,17,0))
    @wed_class = FactoryGirl.create(:event, :location => @cmu, :program => @soupkitchen, :date => 4.days.from_now.to_date, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
    @today_class = FactoryGirl.create(:event, :location => @cmu, :program => @soupkitchen, :date => Date.today, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
  end
  
  def remove_event_context
    @choir_performance.destroy
    @soccer.destroy
    @sat_prep.destroy
    @mon_class.destroy
    @tues_class.destroy
    @wed_class.destroy
    @today_class.destroy
  end
  
 # Context for guardians
  def create_guardian_context
  	@lsmith = FactoryGirl.create(:guardian, household: @smith)
  	@mshroot = FactoryGirl.create(:guardian, household: @shroot, first_name: "Mary", last_name: "Shroot", guardian_type: 'Mother')
    @cscott = FactoryGirl.create(:guardian, household: @scott, first_name: "Clark", last_name: "Scott", cell_phone: "412-222-2222")
  end
  
  def remove_guardian_context
    @lsmith.destroy
    @mshroot.destroy
    @cscott.destroy
  end
  
 # Context for households
  def create_household_context
    @smith = FactoryGirl.create(:household)
    sleep 1
    @shroot = FactoryGirl.create(:household, :name => "Shroot", :street => "43 New Lane", :city => "New York", :zip => '10540', :active => false)
    sleep 1
    @scott = FactoryGirl.create(:household, :name => "Scott", :street => "123 Cool Place", :city => "Scranton", :zip => '48579', :active => true)
    sleep 1
  end
  
  def remove_household_context
    @smith.destroy
    @shroot.destroy
    @scott.destroy
  end
  
 # Context for locations
  def create_location_context
    @cmu = FactoryGirl.create(:location)
    sleep 1
   	@new_jersey = FactoryGirl.create(:location, :name => "Jocelyn's Home", :street => "12 Somewhere Road", :city => "Someplace", :zip => '10000', :active => false)
   	sleep 1
    @oakland = FactoryGirl.create(:location, :name => "Oakland")
    sleep 1
  end
  
  def remove_location_context
    @cmu.destroy
    @new_jersey.destroy
    @oakland.destroy
  end

 # Context for programs
  def create_program_context
    @choir = FactoryGirl.create(:program, department: @arts)
    @soccer = FactoryGirl.create(:program, department: @athletics, name: "Soccer", description: "Soccer Intramural Sports", max_grade: 9, min_grade: 6, max_capacity: 75, active: true, start_date: 4.months.ago.to_date, end_date: nil)
    @soupkitchen = FactoryGirl.create(:program, department: @outreach, name: "Soup Kitchen", description: "Help nearby soup kitchen serve food", max_grade: 12, min_grade: 4, max_capacity: 50, active: false, start_date: 7.months.ago.to_date, end_date: 2.months.ago.to_date)
  end
  
  def remove_program_context
    @choir.destroy
    @athletics.destroy
    @soupkitchen.destroy
  end

 # Context for section events
  def create_section_event_context
    
  end
  
  def remove_section_event_context
  end 

 # Context for sections
  def create_section_context
  	@main_section = FactoryGirl.create(:section, program: @choir)
    @inactive_section = FactoryGirl.create(:section, program: @choir, active: false)
  end
  
  def remove_section_context
    @main_section.destroy
    @inactive_section.destroy
  end

 # Context for students
  def create_student_context
   @alex = FactoryGirl.create(:student, household: @smith)
   @stephany = FactoryGirl.create(:student, household: @shroot, first_name: "Stephany", last_name: "Park", grade: 8, is_male: true)
   @sean = FactoryGirl.create(:student, household: @scott, first_name: "Sean", last_name: "Kumar", grade: 4, is_male: true)
   @amanda = FactoryGirl.create(:student, household:@smith, first_name: "Amanda", last_name: "Works", grade: 6, is_male: false)
  end
 
  def remove_student_context
   @alex.destroy
   @stephany.destroy
   @sean.destroy
   @amanda.destroy
  end 
  
 # Context for medical conditions
  def create_drug_context
    @motrin = FactoryGirl.create(:drug, name: "Motrin", active: true, otc: true, description: "Helps alleviate fever and menstrual cramps")
    @ibuprofen = FactoryGirl.create(:drug, name: "Ibuprofen", active: true, otc: true, description: "Used for headaches")
    @advil = FactoryGirl.create(:drug, name: "Advil", active: true, otc: true)
    @antihistamine = FactoryGirl.create(:drug, name: "Antihistamine", active: false, otc: false, description: "Used for allergies and sinuses")
  end

  def remove_drug_context
    @motrin.destroy
    @ibuprofen.destroy
    @advil.destroy
    @antihistamine.destroy
  end

  # Context for volunteers
  def create_volunteer_context
    @brian = FactoryGirl.create(:volunteer)
    @james = FactoryGirl.create(:volunteer, first_name: "James", last_name: "Peters", can_text: false)
    @dan = FactoryGirl.create(:volunteer, first_name: "Dan", last_name: "Humphrey", app_approved: false)
  end
  
  def remove_volunteer_context
    @brian.destroy
    @james.destroy
    @dan.destroy
  end
  
  # Context for schools
  def create_school_context
    @capa_loc = FactoryGirl.create(:location, name: "CAPA School", street: "111 Ninth Street", city: "Pittsburgh", zip: '15222', active: true)
    @capa = FactoryGirl.create(:school, name: "CAPA School", location: @capa_loc, min_grade: 6, max_grade: 12, category: 'public', active: true, phone: '412-338-6143')
    sleep 1
    @perry_loc = FactoryGirl.create(:location, name: "Perry High School", street: "3875 Perrysville Avenue", city: "Pittsburgh", zip: '15214', active: true)
    @perry = FactoryGirl.create(:school, name: "Perry High School", location: @perry_loc, min_grade: 9, max_grade: 12, category: 'public', active: true, phone: '412-323-3404')
    sleep 1
    @conroy_loc = FactoryGirl.create(:location, :name => "Conroy School", street: "1398 Page Street", city: "Pittsburgh", zip: '15233', active: true)
    @conroy = FactoryGirl.create(:school, name: "Conroy School", location: @conroy_loc, min_grade: 1, max_grade: 5, category: 'public', active: true, phone: '412-323-3495')
    sleep 1
    @north_catholic_loc = FactoryGirl.create(:location, name: "North Catholic School", street: "1400 Troy Hill Rd", city: "Pittsburgh", zip: '15212', active: true)
    @north_catholic = FactoryGirl.create(:school, name: "North Catholic School", location: @north_catholic_loc, min_grade: 6, max_grade: 12, category: 'catholic', active: true, phone: '412-321-4823')
    sleep 1
    @kli_loc = FactoryGirl.create(:location, name: "ACAC", street: "250 East Ohio", city: "Pittsburgh", zip: '15212', active: true)
    @kli = FactoryGirl.create(:school, location: @kli_loc)
  end
  
  def remove_school_context
    @capa_loc.destroy
    @capa.destroy
    @perry_loc.destroy
    @perry.destroy
    @conroy_loc.destroy
    @conroy.destroy
    @north_catholic_loc.destroy 
    @north_catholic.destroy
    @kli_loc.destroy
    @kli.destroy
  end
  
end
