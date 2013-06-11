class Shift < ActiveRecord::Base
  attr_accessible :end_time, :shiftable_id, :shiftable_type, :start_time, :volunteer_id, :hidden_id, :hidden_klass
  attr_accessor :hidden_id, :hidden_klass
  
  # Set up shifts as polymorphic
  belongs_to :shiftable, :polymorphic => true
  
  #Other relationship
  belongs_to :volunteer
  has_many :notes, :as => :notable, :dependent => :destroy
  
  #validation
  validates_presence_of :start_time
  validates_time :start_time, :message => "must enter a start time"
  validates_time :end_time, :after => :start_time, :after_message => "must be after the start of the event", :allow_blank => true

  #Scopes
  scope :chronological, order(:start_time)
  scope :by_date_desc, order('start_time DESC')
  scope :shifts_today, lambda { WHERE("start_time BETWEEN '#{DateTime.now.beginning_of_day}' AND '#{DateTime.now.end_of_day}'") }
  scope :past, where('start_time < ?', DateTime.now)
  scope :upcoming, where('start_time >= ?', DateTime.now)
  scope :no_end_time, where('end_time IS NULL')
  scope :last_week, where("start_time >= ? AND start_time >= ?", DateTime.now.end_of_day, 1.week.ago.to_datetime)
  
  #Methods
  def hours
    ((self.end_time-self.start_time)/ 1.hour).round
  end
  def hours_this_week
    self.inject {|sum,x| sum + x.hours}
  end
end
