
class Training < ActiveRecord::Base
  attr_accessible :description, :level, :name, :next_offered

    #Relationships
    has_many :volunteer_trainings, :dependent => :delete_all
    has_many :volunteers, :through => :volunteer_trainings
    has_many :department_trainings, :dependent => :delete_all
    has_many :departments, :through => :department_trainings
    has_many :notes, :as => :notable, :dependent => :destroy
    
    validates_presence_of :name
    validates_uniqueness_of :name
    
    scope :alphabetical, order('name')
    
end
