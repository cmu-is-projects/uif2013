require 'test_helper'

class VolunteerTest < ActiveSupport::TestCase
  #test Presences
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:date_of_birth)
  should validate_presence_of(:role)  
  should validate_presence_of(:status)
  should validate_presence_of(:name_displayed)

  
  #Test values
  should allow_value("Anthony").for(:first_name)
  should allow_value("Lorubbio").for(:last_name)
  
  should allow_value("412.338.1414").for(:cell_phone)
  should allow_value("412-338-1414").for(:cell_phone)
  should allow_value("4123381414").for(:cell_phone)
  should allow_value("412 338 1414").for(:cell_phone)
  should_not allow_value("threefourfive").for(:cell_phone)
  should_not allow_value("123-4567").for(:cell_phone)
  

  context "Creating a volunteer context" do
    setup do 
      create_volunteer_context
    end
    
    teardown do
      remove_volunteer_context
    end
    
    should "have scope for ordering by last name" do
      #assert_equal ["Smith"], Volunteer.alphabetical.all.map(&:last_name)
      assert_equal ["Humphrey","Peters","Smith"], Volunteer.alphabetical.all.map(&:last_name)
    end

    should "have scope for approved applications" do
      #assert_equal ["Smith"], Volunteer.alphabetical.all.map(&:last_name)
      assert_equal ["Peters","Smith"], Volunteer.application_approved.alphabetical.all.map(&:last_name)
    end

    should "have scope for pending applications" do
      #assert_equal ["Smith"], Volunteer.alphabetical.all.map(&:last_name)
      assert_equal ["Humphrey"], Volunteer.pending_applications.alphabetical.all.map(&:last_name)
    end
    
    should "have scope for can text" do
      #assert_equal ["Smith"], Volunteer.alphabetical.all.map(&:last_name)
      assert_equal ["Humphrey","Smith"], Volunteer.text.alphabetical.all.map(&:last_name)
    end
    
  end
  
end
