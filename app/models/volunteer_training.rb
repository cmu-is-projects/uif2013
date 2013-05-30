class VolunteerTraining < ActiveRecord::Base
  attr_accessible :date, :training_id, :volunteer_id

    belongs_to :volunteer
    belongs_to :training

    validates_presence_of :date
 
end
