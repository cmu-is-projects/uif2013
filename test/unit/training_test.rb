require 'test_helper'


class TrainingTest < ActiveSupport::TestCase
    #Test relationships
    should have_many(:volunteer_trainings)
    should have_many(:department_trainings)

    #Test validations
    should validate_presence_of(:name)
    should validate_uniqueness_of(:name)

    
    context "2 Trainings" do
    # create the objects I want with factories
    setup do
    @driving = FactoryGirl.create(:training)
    @cooking = FactoryGirl.create(:training, :name => "Cooking", :description => "Instructs volunteers how to prepare meals")
   
    end

    # and provide a teardown method as well
    teardown do
        @driving.destroy
        @cooking.destroy
     end

    # test the scope 'alphabetical'
    should "shows that there are two trainings in in alphabetical order" do
        assert_equal ["Cooking", "Driving"], Training.alphabetical.map{|s| s.name}
    end

    end
end
