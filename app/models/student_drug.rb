class StudentDrug < ActiveRecord::Base
  attr_accessible :dosage, :drug_id, :student_id
end
