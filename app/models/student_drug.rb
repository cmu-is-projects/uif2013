class StudentDrug < ActiveRecord::Base
  attr_accessible :dosage, :drug_id, :student_id

  belongs_to :drug
  belongs_to :student
  
  #Validations
  validates_presence_of :drug_id
  validates_presence_of :student_id
  validates_numericality_of :drug_id, :student_id, :only_integer => true, :greater_than_or_equal_to => 0, :message => "is not a valid number" 
  validates_numericality_of :dosage, :only_integer => true, :greater_than_or_equal_to => 0, :allow_blank => true, :message => "is not a valid number"  
end
