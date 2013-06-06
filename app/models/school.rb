class School < ActiveRecord::Base
  attr_accessible :name, :location_id, :max_grade, :min_grade, :category, :contact_person, :phone, :active
  
  # categories
  CATEGORIES = [['Public','public'],['Private','private'],['Catholic','catholic'],['Charter','charter']]
  
  # relationships
  belongs_to :location
  has_many :students
  
  # validations
  validates_presence_of :name, :location_id
  validates_inclusion_of :category, :in => CATEGORIES.map{|c| c[1]}, :message => "is not recognized by the system"
  validates_numericality_of :min_grade, :only_integer => true, :greater_than => -1, :allow_blank => true
  validates_numericality_of :max_grade, :only_integer => true, :greater_than_or_equal_to => :min_grade, :allow_blank => true
  validates_numericality_of :location_id, :only_integer => true, :greater_than => 0
  validates_format_of :phone, :with => /^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$/, :allow_blank => true, :message => "should be 10 digits (area code needed) and delimited with dashes or spaces only"
  
  # scopes
  scope :alphabetical, order('name')
    
end
