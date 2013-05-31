class DepartmentTraining < ActiveRecord::Base
  attr_accessible :department_id, :training_id

    belongs_to :department
    belongs_to :training
    
    
end
