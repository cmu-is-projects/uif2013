require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  #Test relationships
  should belong_to(:section)
  should belong_to(:student)
  should have_one(:program).through(:section)
  
  #Test Validations
  should validate_presence_of(:section_id)
  should validate_presence_of(:student_id)
  
  #Test Values
  should allow_value(4).for(:section_id)
  should allow_value(1234).for(:section_id)
  should_not allow_value("four").for(:section_id)
  should_not allow_value(-4).for(:section_id)
  
  should allow_value(4).for(:student_id)
  should allow_value(309486).for(:student_id)
  should_not allow_value("four").for(:student_id)
  should_not allow_value(-4).for(:student_id)

 context "2 Enrollments" do
    # create the objects I want with factories
    setup do
      @alex = FactoryGirl.create(:student)
      @main_section = FactoryGirl.create(:section)
      @inactive_section = FactoryGirl.create(:section, active: false)
      @active = FactoryGirl.create(:enrollment, student: @alex, section: @main_section)
      @inactive = FactoryGirl.create(:enrollment, student: @alex, section: @inactive_section)
    end

    # and provide a teardown method as well
    teardown do
      @active.destroy
      @inactive.destroy
    end

    # test the scope 'active'
    should "shows that there is one enrollment with active section" do
      #assert_equal 1, Department.active.size
    end
  end


end
