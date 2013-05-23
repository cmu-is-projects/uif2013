require 'test_helper'
#

class AllergyTest < ActiveSupport::TestCase
  #relationships
  should have_many(:students).through(:student_allergies)
  
  #validations
  should validate_presence_of(:name)
  
  #values
  should allow_value("peanuts").for(:name)
  should allow_value("pollen").for(:name)
  should allow_value("lactose").for(:name)
  should allow_value("latex").for(:name)  
  should_not allow_value(3).for(:name)
  should_not allow_value(-15).for(:name)
  should_not allow_value(nil).for(:name)
  should_not allow_value(true).for(:name)
  should_not allow_value(false).for(:name)
  
  
  should allow_value("typically found in milk").for(:warning_text)
  should allow_value("found in various foods").for(:warning_text)
  should_not allow_value(7).for(:warning_text)
  should_not allow_value(-7).for(:warning_text)
  should_not allow_value(true).for(:warning_text)
  should_not allow_value(false).for(:warning_text)

  should allow_value(true).for(:active) 
  should allow_value(false).for(:active)
  should_not allow_value("cookies").for(:active)
  should_not allow_value(3).for(:active)
  should_not allow_value(-3).for(:active)


end