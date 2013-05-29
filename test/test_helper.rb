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
    @shroot = FactoryGirl.create(:household, :name => "Shroot", :street => "43 New Lane", :city => "New York", :zip => '10540', :active => false)
    @scott = FactoryGirl.create(:household, :name => "Scott", :street => "123 Cool Place", :city => "Scranton", :zip => '48579', :active => true)
  end
  
  def remove_household_context
    @smith.destroy
    @shroot.destroy
    @scott.destroy
  end
  
 # Context for locations
  def create_location_context
    @cmu = FactoryGirl.create(:location)
   	@new_jersey = FactoryGirl.create(:location, :name => "Jocelyn's Home", :street => "12 Somewhere Road", :city => "Someplace", :zip => '10000', :active => false)
    @oakland = FactoryGirl.create(:location, :name => "Oakland")
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
  
 # Context for student allergies
  def create_student_allergy_context
    
  end
  
  def remove_student_allergy_context
   
  end
end
