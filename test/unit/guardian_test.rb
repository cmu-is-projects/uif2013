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
  should_not allow_value("four").for(:section_id)
  should_not allow_value(-4).for(:section_id)
  #Test Values for email

end
