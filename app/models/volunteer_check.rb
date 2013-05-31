class VolunteerCheck < ActiveRecord::Base
  attr_accessible :approved, :check_id, :date_completed, :date_submitted, :notes, :paid, :volunteer_id

    belongs_to :volunteer
    belongs_to :check
    

end
