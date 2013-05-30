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




end
end
