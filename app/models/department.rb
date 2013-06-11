class Department < ActiveRecord::Base
  attr_accessible :active, :description, :name

  #Relationships
  has_many :programs, :dependent => :delete_all
  has_many :department_trainings, :dependent => :delete_all
  has_many :trainings, :through => :department_trainings

  validates_presence_of :name
  validates_uniqueness_of :name
  
  scope :alphabetical, order('name')
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
end
