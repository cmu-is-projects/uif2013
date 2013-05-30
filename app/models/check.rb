class Check < ActiveRecord::Base
  attr_accessible :cost, :duration, :name

    has_many :volunteer_checks, :dependent => :delete_all
    validates_presence_of :name
    validates_uniqueness_of :name

    scope :alphabetical, order('name')

end
