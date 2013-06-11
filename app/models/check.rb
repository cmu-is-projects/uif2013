class Check < ActiveRecord::Base

    attr_accessible :cost, :duration, :name
    
    has_many :volunteer_checks, :dependent => :delete_all
    has_many :volunteers, :through => :volunteer_checks
    
    has_many :notes, :as => :notable, :dependent => :destroy
    
    validates_presence_of :name
    validates_uniqueness_of :name
    
    scope :alphabetical, order('name')

end
