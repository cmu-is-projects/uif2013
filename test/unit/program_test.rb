require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  # Test relationships
  should belong_to(:department)
  should have_many(:events)
  should have_many(:enrollments).through(:sections)
  should have_many(:locations).through(:events)
  
  # Test validations
  should validate_presence_of(:name)
  should validate_presence_of(:max_grade)
  should validate_presence_of(:min_grade)
  should validate_presence_of(:max_capacity)
  should validate_uniqueness_of(:name)
  
  # Test for max/min capacity
  should allow_value(1).for(:max_grade)
  should allow_value(2).for(:max_grade)
  should allow_value(3).for(:max_grade)
  should allow_value(4).for(:max_grade)
  should allow_value(5).for(:max_grade)
  should allow_value(6).for(:max_grade)
  should allow_value(7).for(:max_grade)
  should allow_value(8).for(:max_grade)
  should allow_value(9).for(:max_grade)
  should allow_value(10).for(:max_grade)
  should allow_value(11).for(:max_grade)
  should allow_value(12).for(:max_grade)
  should_not allow_value(13).for(:max_grade)
  should_not allow_value(0).for(:min_grade)
  should allow_value(1).for(:min_grade)
  should allow_value(2).for(:min_grade)
  should allow_value(3).for(:min_grade)
  should allow_value(4).for(:min_grade)
  should allow_value(5).for(:min_grade)
  should allow_value(6).for(:min_grade)
  should allow_value(7).for(:min_grade)
  should allow_value(8).for(:min_grade)
  should allow_value(9).for(:min_grade)
  should allow_value(10).for(:min_grade)
  should allow_value(11).for(:min_grade)
  should allow_value(12).for(:min_grade)
  should_not allow_value("bad").for(:max_grade)
  should_not allow_value(0).for(:max_grade)
  should_not allow_value(2.5).for(:max_grade)
  should_not allow_value(-2).for(:max_grade)
  should_not allow_value("bad").for(:min_grade)
  should_not allow_value(0).for(:min_grade)
  should_not allow_value(2.5).for(:min_grade)
  should_not allow_value(-2).for(:min_grade)
  should allow_value(12).for(:max_capacity)
  should_not allow_value(0).for(:max_capacity)
  should_not allow_value("bad").for(:max_capacity)
  should_not allow_value(-2).for(:max_capacity)
  should_not allow_value(2.5).for(:max_capacity)
  
  # Test for start date
  should allow_value(7.weeks.ago.to_date).for(:start_date)
  should allow_value(2.years.ago.to_date).for(:start_date)
  should_not allow_value("bad").for(:start_date)
  should_not allow_value(nil).for(:start_date)
  should allow_value(nil).for(:end_date)
  
  context "creating the context" do
     # Create objects for factories
     setup do
       create_department_context
       create_program_context
     end

     # Provide teardown method
     teardown do
        remove_department_context
        remove_program_context
     end
    
    # Test Scopes

    should "require case sensitive unique value for name" do
      @repeat_soccer = FactoryGirl.build(:program, department: @athletics, name: "Soccer")
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

    # test the scope 'past' by ensuring that the end date is not null"
    should "shows that there is one program that occurred in the past" do
      assert_equal ["Soup Kitchen"], Program.past.alphabetical.map{|s| s.name}
    end
    
    # test the scope that start date cannot be after end date
    should "ensure that program end date does not precede the program start date" do
      @soccer_bad = FactoryGirl.build(:program, :name => "SoccerBad", :department => @athletics, :start_date => 2.weeks.ago.to_date, :end_date => 3.weeks.ago.to_date, active: false, max_grade: 7, min_grade: 4, max_capacity: 40)
      deny @soccer_bad.valid?
      assert @soccer.valid?
    end
    
    # test to ensure max grade cannot be less than min grade 
    should "not allow max grade to be less than min grade" do
      @choir_bad = FactoryGirl.build(:program, :department => @arts, :max_grade => 4, :min_grade => 11, max_capacity: 35, active: true)
      assert_equal "must be greater than min grade", @choir_bad.max_grade_greater_than_min_grade
      #deny @choir_bad.valid?
      #assert @choir.valid?
    end

    # test to see whether no description returns N/A
    should "ensure that if the program has no description it should return N/A" do
      @choir_nodesc = FactoryGirl.build(:program, department: @arts, max_grade: 12, min_grade: 6, max_capacity: 60, active: true)
      deny @choir_nodesc.valid?
      assert_equal 0, @choir_nodesc.description.size
      assert_equal "N/A", @choir_nodesc.hasdescription
    end

    # test to see if enddate format is correct and valid
    should "ensure that enddate has the correct format" do
      assert_equal "Mar 23, 2013", @soupkitchen.enddateformat
    end

    # test to see whether grade range works correctly
    should "ensure that grade range returns the correct value" do
      assert_equal "6 - 12", @choir.grade_range
    end
    
   end
end
