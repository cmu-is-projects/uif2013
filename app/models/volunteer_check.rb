class VolunteerCheck < ActiveRecord::Base
  require 'date'
  attr_accessible :approved, :check_id, :date_completed, :date_submitted, :notes, :paid, :volunteer_id

    belongs_to :volunteer
    belongs_to :check
    
    validates_presence_of :check_id, :volunteer_id
    
    scope :pending, where('date_completed IS NULL')
    #   scope :expiring, joins(:check).where('duration > ?', (Date.today.month).to_i)
    
    scope :expiring, joins("LEFT JOIN checks ON checks.id = volunteer_checks.check_id").where('duration > ?', 2)

    
    #    scope :expiring, joins("LEFT JOIN checks ON checks.id = volunteer_checks.check_id").where('duration > ?', (Date.today - :date_completed).months.to_s.to_i)

    # scope :expiring, joins("LEFT JOIN checks ON checks.id = volunteer_checks.check_id").where('duration > ?', (Date.today - :date_completed).to_s.to_i)

    
    #    def time_before_expiration
        # ShiftJob.find_all_by_shift_id(self.id).size > 0
    #   (Date.today - date_completed).to_i
    #end

    
    
    # scope :expiring, joins(:check).where('duration > ?', Date.today-date_completed)
    
    
    #    scope :by_store, joins(:assignment, :store).order(:name)

end
