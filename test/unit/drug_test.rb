require 'test_helper'

class DrugTest < ActiveSupport::TestCase

  # Relationships
  should have_many(:student_drugs)
  
  # Validations
  should validate_presence_of(:name)
  should validate_presence_of(:active)
  should validate_presence_of(:otc)
  should validate_uniqeness_of(:name)
  
  # Values
  should allow_value("Ibuprofen").for(:name)
  should allow_value("Advil").for(:name)
  should allow_value("Tylenol").for(:name)
  should allow_value("Antihistamine").for(:name)  
  should_not allow_value(3).for(:name)
  should_not allow_value(-15).for(:name)
  should_not allow_value(nil).for(:name)
  should_not allow_value(true).for(:name)
  should_not allow_value(false).for(:name)
  
  
  should allow_value("typically found in milk").for(:description)
  should allow_value("found in various foods").for(:description)
  should_not allow_value(7).for(:description)
  should_not allow_value(-7).for(:description)
  should_not allow_value(true).for(:description)
  should_not allow_value(false).for(:description)

  should allow_value(true).for(:active) 
  should allow_value(false).for(:active)
  should_not allow_value("Peanuts").for(:active)
  should_not allow_value(3).for(:active)
  should_not allow_value(-3).for(:active)

  # Scopes

context "creating the context" do
     # Create objects for factories
     setup do
       create_drug_context
     end

     # Provide teardown method
     teardown do
        remove_drug_context
     end
    
    # Test Scopes

    should "require case sensitive unique value for name" do
      @repeat_ibuprofen = FactoryGirl.build(:drug, name: "Ibuprofen")
      deny @repeat_soccer.valid?
    end
  
    # test the scope 'active'
    should "shows that there are two active programs" do
      assert_equal 2, Program.active.size
      assert_equal ["Choir", "Soccer"], Program.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there is one inactive program" do
      assert_equal 1, Program.inactive.size
      assert_equal ["Soup Kitchen"], Program.inactive.alphabetical.map{|s| s.name}
    end

    # test to see whether no description returns N/A
    should "ensure that if the program has no description it should return N/A" do
      @choir_nodesc = FactoryGirl.build(:program, department: @arts, max_grade: 12, min_grade: 6, max_capacity: 60, active: true, description:"")
      assert_equal 0, @choir_nodesc.description.size
      assert_equal "N/A", @choir_nodesc.hasdescription
      assert_equal "Choir is for those who love to sing", @choir.hasdescription



end
end
