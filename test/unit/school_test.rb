require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_many(:students)
  should validate_presence_of(:name)
  should validate_presence_of(:location_id)
  should validate_numericality_of(:location_id)
  
  should validate_numericality_of(:min_grade)
  should validate_numericality_of(:max_grade)
  
  should allow_value("public").for(:category)
  should allow_value("private").for(:category)
  should allow_value("catholic").for(:category)
  should allow_value("charter").for(:category)
  should_not allow_value("bad").for(:category)
  should_not allow_value(1).for(:category)
  
  should allow_value("412.338.1414").for(:phone)
  should allow_value("412-338-1414").for(:phone)
  should allow_value("4123381414").for(:phone)
  should allow_value("412 338 1414").for(:phone)
  should_not allow_value("threefourfive").for(:phone)
  should_not allow_value("123-4567").for(:phone)
  
  context "With a school context" do
    # create the objects I want with factories
    setup do
      create_school_context
    end

    # and provide a teardown method as well
    teardown do
      remove_school_context
    end

    # test the scope 'alphabetical'
    should "shows that there are three departments in alphabetical order" do
      assert_equal ["CAPA School","Conroy School","Klingon Language Institute","North Catholic School","Perry High School"], School.alphabetical.map{|s| s.name}
    end

    # test the scope 'active'
    should "shows that there are four active schools" do
      assert_equal 4, School.active.size
    end

    # test the scope 'inactive'
    should "shows that there is one inactive school" do
      assert_equal 1, School.inactive.size
      assert_equal ["Klingon Language Institute"], School.inactive.alphabetical.map{|s| s.name}
    end
  end
end
