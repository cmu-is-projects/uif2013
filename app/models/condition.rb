class Condition < ActiveRecord::Base
  attr_accessible :active, :name, :warning_text
  
  has_many :student_conditions, :dependent => :delete_all
  has_many :students, :through => :student_conditions
  validates_presence_of :name
  
  scope :by_studentcondition, joins(:student_condition)
  scope :alphabetical, order(:name)
  
end
