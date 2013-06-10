class VolunteerCheck < ActiveRecord::Base
  attr_accessible :approved, :check_id, :date_completed, :date_submitted, :notes, :paid, :volunteer_id

    belongs_to :volunteer
    belongs_to :check
    
    scope :for_volunteer, lambda {|volunteer_id| where("volunteer_id = ?", volunteer_id) }
    scope :for_check, lambda {|check_id| where("check_id = ?", check_id) }


end
