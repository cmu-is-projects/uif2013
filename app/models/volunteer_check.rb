class VolunteerCheck < ActiveRecord::Base
  attr_accessible :approved, :check_id, :date_completed, :date_submitted, :notes, :paid, :volunteer_id

    belongs_to :volunteer
    belongs_to :check
    
    scope :pending, where('date_completed IS NULL')
    scope :expiring, lambda {|duration| joins(:check).where("duration = ?", duration) }
    
    
end
