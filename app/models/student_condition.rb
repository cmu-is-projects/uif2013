class StudentCondition < ActiveRecord::Base
  attr_accessible :condition_id, :student_id
  
  belongs_to :condition
  belongs_to :student
  
  #Validations
  validates_presence_of :condition_id, :student_id
  validates_numericality_of :condition_id, :only_integer => true, :greater_than_or_equal_to => 0
  validates_numericality_of :student_id, :only_integer => true, :greater_than_or_equal_to => 0
  
end
