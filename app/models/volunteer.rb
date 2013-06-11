require 'carrierwave/orm/activerecord'
require 'prawn'

class Volunteer < ActiveRecord::Base
  attr_accessible :app_approved, :app_submit_date, :barcode_number, :can_text, :cell_phone, :date_of_birth, :email, :first_name, :household_id, :is_male, :last_name, :name_displayed, :role, :spouse_id, :status, :student_id, :household_attributes
  before_save :reformat_phone, :assign_barcode, :avatar
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }
  
  #Relationships
  belongs_to :household
  has_many :shifts, :as => :shiftable
  has_many :volunteer_trainings
  has_many :trainings, :through => :volunteer_trainings
  has_many :checks, :through => :volunteer_checks
  has_many :volunteer_meals
  has_many :events, :through => :attendances
  has_many :notes, :as => :notable, :dependent => :destroy
  has_many :shifts
  
  #Nested Attributes
  accepts_nested_attributes_for :household, :allow_destroy => true
  
  #Validations
  validates_presence_of :first_name, :last_name, :date_of_birth, :role, :status, :name_displayed
  validates :date_of_birth, :app_submit_date, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$/, :allow_blank => true, :message => "should be 10 digits (area code needed) and delimited with dashes or spaces only"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :allow_blank => true, :message => "is not a valid format"
  validates_uniqueness_of :barcode_number
  validates_numericality_of :household_id, :only_integer => true, :message => "is not a valid number", :allow_blank => true

    
  #Scopes
  scope :alphabetical, order('last_name, first_name')
  scope :application_approved, where('app_approved = ?', true)
  scope :pending_applications, where('app_approved = ?', false)
  scope :text, where('can_text = ?', true)
  scope :new_volunteer, where('created_at > ? ', 1.week.ago)
  
  #Misc constants
  STATUS_LIST = [['Active', 'Active'],['Inactive', 'Inactive'], ['Missing', 'Missing']]
  ROLE_LIST = [['Admin', 'Admin'],['Volunteer', 'Volunteer']] 
  #Other methods
  
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end

  def self.search(query)
    # .length works sometimes, but for now use !query
    if !query
        return 0
    else
      sql = query.split.map do |word|
        %w[first_name last_name].map do |column|
          sanitize_sql ["#{column} LIKE ?", "%#{word}%"]
        end.join(" or ")
      end.join(") and (")
      where(sql)
    end
  end

  def params_to_query(params)
    params.map {|p, v| "#{p}=#{URI.escape(v.to_s)}"}.join('&')
  end

  def append_url(url, params = {})
    uri = URI.parse(url)
    uri.query = uri.query.nil? ? params_to_query(params) : [uri.query, params_to_query(params)].join('&') unless params.empty?
    uri.to_s
  end
  
  def newbarcode
    append_url('http://www.barcodesinc.com/generator/image.php?style=421&type=C128A&width=400&height=100&xres=2&font=5', {:code => self.barcode_number.to_s})
 	  #system("open", append_url('http://www.barcodesinc.com/generator/image.php?style=421&type=C128A&width=400&height=100&xres=2&font=5', {:code => self.barcode_number.to_s}).to_s)
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

  private
  def assign_barcode
    invalid = true
    while invalid
      new_barcode = '00000'+Array.new(7){rand(10)}.join
      @volunteer = Volunteer.find_by_barcode_number(new_barcode)
      if @volunteer.nil?
        self.barcode_number = new_barcode
        invalid = false
      else
        invalid = true
      end  
    end
  end
  
end
