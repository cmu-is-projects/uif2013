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
    @choir = FactoryGirl.create(:program, :department => @arts_department)
    @soccer = FactoryGirl.create(:program, :name => "Soccer", :description => "Kick a ball", :department => @athletics)
    @sat_prep = FactoryGirl.create(:program, :name => "SAT Prep", :description => "Prepare for SATs", :department => @academics)       
    @mon_class = FactoryGirl.create(:event, :location => @cmu, :program => @choir)
    @tues_class = FactoryGirl.create(:event, :location => @cmu, :program => @soccer, :date => 3.days.ago.to_date, :start_time => Time.local(2012,10,3,16,0), :end_time => Time.local(2012,10,3,17,0))
    @wed_class = FactoryGirl.create(:event, :location => @cmu, :program => @sat_prep, :date => 4.days.from_now.to_date, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
    @today_class = FactoryGirl.create(:event, :location => @cmu, :program => @sat_prep, :date => Date.today, :start_time => Time.local(2012,10,10,16,0), :end_time => nil)
  end
  
  def remove_event_context
    @choir.destroy
    @soccer.destroy
    @sat_prep.destroy
    @mon_class.destroy
    @tues_class.destroy
    @wed_class.destroy
    @today_class.destroy
  end
  
 # Context for guardians
  def create_guardian_context
    @arbeit = FactoryGirl.create(:project, domain: @software, manager: @ted, start_date: 1.week.ago.to_date, end_date: nil)
    @proverbs = FactoryGirl.create(:project, name: 'Proverbs', domain: @software, manager: @ed, start_date: 9.weeks.ago.to_date, end_date: nil)
    @bookmanager = FactoryGirl.create(:project, name: 'BookManager', domain: @software, manager: @fred, start_date: 8.weeks.ago.to_date, end_date: nil)
    @choretracker = FactoryGirl.create(:project, name: 'ChoreTracker', domain: @software, manager: @fred, start_date: 7.weeks.ago.to_date)
  end
  
  def remove_guardian_context
    @arbeit.destroy
    @proverbs.destroy
    @bookmanager.destroy
    @choretracker.destroy

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
    @choir = FactoryGirl.create(:program, :department => @arts)
    @basketball = FactoryGirl.create(:department => @athletics, :name => "Basketball", :description => "Basketball Intramural Sports")
    @soupkitchen = FactoryGirl.create(:department => @outreach, :name => "Soup Kitchen", :description => "Help nearby soup kitchen serve food")
  end
  
  def remove_program_context
    @choir.destroy
    @athletics.destroy
    @soupkitchen.destroy
  end

 # Context for registrations
  def create_registration_context
    @arbeit_t1 = FactoryGirl.create(:task, project: @arbeit, creator: @ed, completer: @ed)
    @arbeit_t2 = FactoryGirl.create(:task, name: 'Wireframing', project: @arbeit, due_on: 1.day.from_now, due_string: "tomorrow", creator: @ted, completer: nil, completed: false)
    @arbeit_t3 = FactoryGirl.create(:task, name: 'Create stylesheets', project: @arbeit, due_on: 3.days.from_now, due_string: "3 days ago", creator: @ted, completer: nil, completed: false)
    @proverbs_t1 = FactoryGirl.create(:task, name: 'Unit testing', project: @proverbs, due_on: 5.days.ago, due_string: "5 days ago", creator: @ted, completer: @ted, completed: true)
    @bookmanager_t1 = FactoryGirl.create(:task, name: 'Modify controllers', project: @bookmanager, due_on: 4.days.ago, due_string: "4 days ago", creator: @fred, completer: @fred, completed: true, priority: 2)
    @bookmanager_t2 = FactoryGirl.create(:task, name: 'User testing', project: @bookmanager, due_on: 3.days.ago, due_string: "3 days ago", creator: @ted, completer: @fred, completed: true)
    @bookmanager_t3 = FactoryGirl.create(:task, name: 'Security review', project: @bookmanager, due_on: 2.days.ago, due_string: "2 days ago", creator: @fred, completer: nil, completed: false)
  end
  
  def remove_registration_context
    @arbeit_t1.destroy
    @arbeit_t2.destroy
    @arbeit_t3.destroy
    @proverbs_t1.destroy
    @bookmanager_t1.destroy
    @bookmanager_t2.destroy
    @bookmanager_t3.destroy
  end

 # Context for section events
  def create_section_event_context
    
  end
  
  def remove_section_event_context
   

 # Context for sections
  def create_section_context
   
  end
  
  def remove_section_context
    
  end

 # Context for students
  def create_student_context
   
  end
  
  def remove_student_context
   
  end

 # Context for student allergies
  def create_student_allergy_context
    
  end
  
  def remove_student_allergy_context
   
  end
  end
end
