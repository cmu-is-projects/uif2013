class Drug < ActiveRecord::Base
  attr_accessible :active, :drug_id, :name, :otc, :description

  # Relationships
    has_many :student_drugs, :dependent => :delete_all

  # Validations
    validates_presence_of :name, :active, :otc
  	validates_uniqueness_of :name

  # Scopes
    scope :alphabetical, order(:name)
	scope :active, where('active = ?', true)
	scope :inactive, where('active = ?', false)

  # Methods
	def hasdescription
    	if self.description.length > 0
      		return self.description
    	else
      		return "N/A"
    	end
  	end
  	
end
