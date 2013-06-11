require 'test_helper'

class CheckTest < ActiveSupport::TestCase

    #Test relationships
    should have_many(:volunteer_checks)
    
    #Test validations
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)
    
    
    context "2 Checks" do
    # create the objects I want with factories
    setup do
    @insurance = FactoryGirl.create(:check, :name => "Insurance Check")
    @background = FactoryGirl.create(:check)
    
end

# and provide a teardown method as well
teardown do
    @insurance.destroy
    @background.destroy
end

# test the scope 'alphabetical'
should "shows that there are two checks in in alphabetical order" do
    assert_equal ["Background Check", "Insurance Check"], Check.alphabetical.map{|s| s.name}
end

end

end
