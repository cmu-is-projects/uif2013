class VolunteerTraining < ActiveRecord::Base
  attr_accessible :date, :training_id, :volunteer_id

    belongs_to :volunteer
    belongs_to :training

    validates_presence_of :date, :training_id, :volunteer_id


    scope :for_volunteer, lambda {|volunteer_id| where("volunteer_id = ?", volunteer_id) }
    scope :for_training, lambda {|training_id| where("training_id = ?", training_id) }

 
end
