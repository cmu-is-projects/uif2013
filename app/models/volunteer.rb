class Volunteer < ActiveRecord::Base
  attr_accessible :app_approved, :app_submit_date, :barcode_number, :can_text, :cell_phone, :date_of_birth, :email, :first_name, :household_id, :is_male, :last_name, :name_displayed, :role, :status
  
  #Relationships
  has_many :shifts, :as => :shiftable
  has_many :trainings, :through => :volunteer_trainings
  has_many :checks, :through => :volunteer_checks
  has_many :volunteer_meals
  has_many :events, :through => :attendances
  has_many :notes, :as => :notable, :dependent => :destroy
    
  #Validations
  validates_presence_of :first_name, :last_name, :date_of_birth, :barcode_number, :role, :status, :name_displayed
  validates :date_of_birth, :app_submit_date, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$/, :allow_blank => true, :message => "should be 10 digits (area code needed) and delimited with dashes or spaces only"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :allow_blank => true, :message => "is not a valid format"
  validates_format_of :barcode_number, :with => /^\d{12}$/, :message => 'should be 12 digits'
  validates_uniqueness_of :barcode_number
  validates_numericality_of :household_id, :only_integer => true, :message => "is not a valid number", :allow_blank => true

    
  #Scopes
  scope :alphabetical, order('last_name, first_name')
  scope :application_approved, where('app_approved = ?', true)
  scope :pending_applications, where('app_approved = ?', false)
  scope :text, where('can_text = ?', true)

  
  #Other methods
  
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end
  
  # Callback code
  # -----------------------------
  private
  # We need to strip non-digits before saving to db
  def reformat_phone
    phone = self.cell_phone.to_s # change to string in case input as all numbers
    phone.gsub!(/[^0-9]/,"") # strip all non-digits
    self.cell_phone = phone # reset self.phone to new string
  end

end
