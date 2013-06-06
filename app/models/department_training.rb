class DepartmentTraining < ActiveRecord::Base
  attr_accessible :department_id, :training_id

    belongs_to :department
    belongs_to :training
    validates_uniqueness_of :department_id, :scope => :training_id
    
end
