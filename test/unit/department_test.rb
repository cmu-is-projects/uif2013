require 'test_helper'

class DepartmentTest < ActiveSupport::TestCase
  #Test relationships
  should have_many(:programs)

  #Test validations
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)

  context "3 Departments" do
    # create the objects I want with factories
    setup do
      create_department_context
    end

    # and provide a teardown method as well
    teardown do
      remove_department_context
    end

    # test the scope 'alphabetical'
    should "shows that there are three departments in alphabetical order" do
      assert_equal ["Athletics", "Global Outreach", "Peforming Arts"], Department.alphabetical.map{|s| s.name}
    end

    # test the scope 'active'
    should "shows that there are two active stores" do
      assert_equal 2, Department.active.size
    end

    # test the scope 'inactive'
    should "shows that there is one inactive store" do
      assert_equal 1, Department.inactive.size
      assert_equal ["Global Outreach"], Department.inactive.alphabetical.map{|s| s.name}
    end
  end
end
