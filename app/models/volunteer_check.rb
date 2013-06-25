class VolunteerCheck < ActiveRecord::Base
  require 'date'
  attr_accessible :approved, :check_id, :date_completed, :date_submitted, :notes, :paid, :volunteer_id

    belongs_to :volunteer
    belongs_to :check
    
    validates_presence_of :check_id, :volunteer_id
    
    scope :pending, where('date_completed IS NULL')
    scope :completed, where('date_completed IS NOT NULL')
 

	def self.expiring
		VolunteerCheck.completed.select{ |vc| (( vc.date_completed + vc.check.duration.months ) - Date.today).to_i < 30}
	end



end
