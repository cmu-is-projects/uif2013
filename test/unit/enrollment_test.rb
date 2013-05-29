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
      create_household_context
      create_student_context
      create_department_context
      create_program_context
      create_section_context
      @active = FactoryGirl.create(:enrollment, student: @alex, section: @main_section)
      @inactive = FactoryGirl.create(:enrollment, student: @sean, section: @inactive_section)
    end

    # and provide a teardown method as well
    teardown do
      remove_household_context
      remove_student_context
      remove_department_context
      remove_program_context
      remove_section_context
      @active.destroy
      @inactive.destroy
    end

    # test the scope 'active'
    should "shows that there is one enrollment with active section" do
      assert_equal 1, Enrollment.active.size
    end
  end

end
