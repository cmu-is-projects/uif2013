class Section < ActiveRecord::Base
  attr_accessible :active, :max_capacity, :name, :program_id, :enrollments_attributes
  #Relationships
  belongs_to :program
  has_many :enrollments, :dependent => :delete_all
  has_many :section_events, :dependent => :delete_all
  has_many :events, :through => :section_events
  
  #Nested attributes
  accepts_nested_attributes_for :enrollments

  scope :active, where('active = ?', true) 
  scope :alphabetical, joins('left join programs on sections.program_id=programs.id').order('programs.name, sections.name')
  scope :maxed_out, joins(:enrollments).select('sections.id').group('sections.id').having('count(enrollments.id) = sections.max_capacity')
  scope :empty_sections, joins('left outer join enrollments on sections.id=enrollments.section_id').select('sections.id').group('sections.id').having('count(enrollments.id) = 0')

  
  #Validations
  validates_presence_of :name
  validates_numericality_of :max_capacity, :greater_than => 1, :message => "must be greater than 1", :allow_nil => true
  
  
end
