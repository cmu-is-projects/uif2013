require 'test_helper'

class GuardianTest < ActiveSupport::TestCase  
  # Relationships
  should belong_to(:household)
  
  # Validations
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)
  should validate_presence_of(:guardian_type)

  #Test Values for cellphone
  should allow_value("412-222-2222").for(:cell_phone)
  should allow_value("2121231234").for(:cell_phone)
  should_not allow_value("hi").for(:cell_phone)
  should_not allow_value("#&").for(:cell_phone)
  #Test Values for email
  should allow_value("me@example.com").for(:email)
  should_not allow_value("example.com").for(:email)
  should_not allow_value("e4567").for(:email)

  context "Guardians" do
    # create the objects I want with factories
    setup do
      create_household_context
      create_student_context
      create_guardian_context
    end

    # and provide a teardown method as well
    teardown do
      remove_household_context
      remove_student_context
      remove_guardian_context
    end

    # test the scope 'alphabetical'
    should "show 3 guardians in an alphabetical order" do
      assert_equal ["Scott, Clark", "Shroot, Mary", "Smith, Larry"], Guardian.alphabetical.map{|s| s.name}
    end

    #name method
    should "have working name method" do 
      assert_equal "Smith, Larry", @lsmith.name
    end

    #proper_name method
	should "have working proper_name method" do 
      assert_equal "Larry Smith", @lsmith.proper_name
    end

    #reformat_phone method
    should "reformat phone number" do
      assert_equal "4122222222", @cscott.cell_phone
    end

    #get children of the guardian
    should "get children of the guardian" do
      assert_equal "Alexander Heimann", @lsmith.my_children.proper_name
    end
  end
end
