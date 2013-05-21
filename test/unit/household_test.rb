require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  
  # Test Relationships
  should have_many(:guardians)
  should have_many(:students)

  # Test Validations
  should validate_presence_of(:name)
  should validate_presence_of(:street)
  should validate_presence_of(:city)
  should validate_presence_of(:zip)
  
  # Tests for Zipcode
  should validate_format_of(:zip).with(/^\d{5}(\-\d{4})?$/)

  should allow_value("15213").for(:zip)
  should_not allow_value("bad").for(:zip)
  should_not allow_value("1512").for(:zip)
  should_not allow_value("152134").for(:zip)
  should allow_value("15213-0983").for(:zip)

 # Test for Longitude and Latitude
  should validate_numericality_of(:lat)
  should validate_numericality_of(:lon)

  should allow_value(19.23).for(:lat)
  should allow_value(-19.23).for(:lat)
  should_not allow_value("bad").for(:lat)
  should allow_value(19.23).for(:lon)
  should allow_value(-19.23).for(:lon)
  should_not allow_value("bad").for(:lon)

# Establish context
  context "Creating three households" do
    # Create Objects using Factories
    setup do
      @smith = FactoryGirl.create(:household)
      @shroot = FactoryGirl.create(:household, :name => "Shroot", :street => "43 New Lane", :city => "New York", :zip => '10540', :active => false)
      @scott = FactoryGirl.create(:household, :name => "Scott", :street => "123 Cool Place", :city => "Scranton", :zip => '48579', :active => true)
    end
    
    # Provide teardown method
    teardown do
      @smith.destroy
      @shroot.destroy
      @scott.destroy
    end
  
    # Test Scopes

    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal "Smith", @smith.name
      assert @scott.active
      deny @shroot.active
    end

    # test households must be listed alphabetically by name
    should "have all the households listed alphabetically by name" do
      assert_equal ["Scott","Shroot", "Smith"], Household.alphabetical.map{|s| s.name}
    end
  
    # test the scope 'active'
    should "shows that there are two active households" do
      assert_equal 2, Household.active.size
      assert_equal ["Scott", "Smith"], Household.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there is one inactive household" do
      assert_equal 1, Household.inactive.size
      assert_equal ["Shroot"], Household.inactive.alphabetical.map{|s| s.name}
    end
  end
  
end
