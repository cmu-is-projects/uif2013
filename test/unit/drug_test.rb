require 'test_helper'

class DrugTest < ActiveSupport::TestCase

  # Relationships
   # should have_many(:student_drugs)
  
  # Validations
    should validate_presence_of(:name)
  
  # Values
  # should allow_value("Ibuprofen").for(:name)
  # should allow_value("Advil").for(:name)
  # should allow_value("Tylenol").for(:name)
  # should allow_value("Antihistamine").for(:name)  
  # should_not allow_value(3).for(:name)
  # should_not allow_value(-15).for(:name)
  # should_not allow_value(nil).for(:name)
  # should_not allow_value(true).for(:name)
  # should_not allow_value(false).for(:name)
  
  
  # should allow_value("typically found in milk").for(:description)
  # should allow_value("found in various foods").for(:description)
  # should_not allow_value(7).for(:description)
  # should_not allow_value(-7).for(:description)
  # should_not allow_value(true).for(:description)
  # should_not allow_value(false).for(:description)

  # should allow_value(true).for(:active) 
  # should allow_value(false).for(:active)
  # should_not allow_value("Peanuts").for(:active)
  # should_not allow_value(3).for(:active)
  # should_not allow_value(-3).for(:active)

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
      deny @repeat_ibuprofen.valid?
    end
  
    # test the scope 'active'
    should "shows that there are three active drugs" do
      assert_equal 3, Drug.active.size
      assert_equal ["Advil", "Ibuprofen", "Motrin"], Drug.active.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'inactive'
    should "shows that there is one inactive drug" do
      assert_equal 1, Drug.inactive.size
      assert_equal ["Antihistamine"], Drug.inactive.alphabetical.map{|s| s.name}
    end

     # test the scope 'is_otc'
    should "shows that there are three OTC drugs" do
      assert_equal 3, Drug.is_otc.size
      assert_equal ["Advil", "Ibuprofen", "Motrin"], Drug.is_otc.alphabetical.map{|s| s.name}
    end
    
    # test the scope 'is_not_otc'
    should "shows that there is one non OTC drug" do
      assert_equal 1, Drug.is_not_otc.size
      assert_equal ["Antihistamine"], Drug.is_not_otc.alphabetical.map{|s| s.name}
    end

    # test to see whether no description returns N/A
    should "ensure that if the drug has no description it should return N/A" do
      assert_equal 0, @advil.description.size
      assert_equal "N/A", @advil.has_description
      assert_equal "Used for headaches", @ibuprofen.has_description
  end



end
end
