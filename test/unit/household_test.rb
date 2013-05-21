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
  context "Creating three locations" do
    # Create Objects using Factories
    setup do
      @cmu = FactoryGirl.create(:household)
      @new_jersey = FactoryGirl.create(:location, :name => "Jocelyn's Home", :street => "12 Somewhere Road", :city => "Someplace", :zip => '10000', :active => false)
      @oakland = FactoryGirl.create(:location, :name => "Oakland")
    end
    
    # Provide teardown method
    teardown do
      @cmu.destroy
      @new_jersey.destroy
      @oakland.destroy
    end
  
    # Test Scopes

    # test one of each factory (not really required, but not a bad idea)
    should "show that all factories are properly created" do
      assert_equal "CMU", @cmu.name
      assert @oakland.active
      deny @new_jersey.active
    end

    # test households must be listed alphabetically by name
    should "have all the households listed alphabetically by name" do
      assert_equal ["CMU","Jocelyn's Home", "Oakland"], Location.alphabetical.map{|s| s.name}
    end
    
    # test households must have unique names
    should "force locations to have unique names" do
      repeat_store = FactoryGirl.build(:location, :name => "CMU")
      deny repeat_store.valid?
    end
  
    # test the scope 'active'
    should "shows that there are two active locations" do
      assert_equal 2, Location.active.size
      assert_equal ["CMU", "Oakland"], Location.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there is one inactive location" do
      assert_equal 1, Location.inactive.size
      assert_equal ["Jocelyn's Home"], Location.inactive.alphabetical.map{|s| s.name}
    end
  end
  
end
