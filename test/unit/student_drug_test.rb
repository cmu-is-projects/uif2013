require 'test_helper'

class StudentDrugTest < ActiveSupport::TestCase
  #Test Relationships
  should belong_to(:drug)
  should belong_to(:student)

  #Test values
  should validate_presence_of(:studeny_id)
  should validate_presence_of(:drug_id)

  should allow_value(1).for(:student_id)
  should_not allow_value("one").for(:student_id)
  should_not allow_value(-1).for(:student_id)

  should allow_value(1).for(:drug_id)
  should_not allow_value("one").for(:drug_id)
  should_not allow_value(-1).for(:drug_id)

  should allow_value(1).for(:dosage)
  should_not allow_value("one").for(:dosage)
  should_not allow_value(-1).for(:dosage)
end
