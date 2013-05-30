
class Training < ActiveRecord::Base
  attr_accessible :description, :level, :name, :next_offered, :type

    #Relationships
    has_many :volunteer_trainings, :dependent => :delete_all
    has_many :department_trainings, :dependent => :delete_all

    
    validates_presence_of :name
    validates_uniqueness_of :name
    
    scope :alphabetical, order('name')
    
end
