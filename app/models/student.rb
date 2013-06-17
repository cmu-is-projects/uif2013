require 'carrierwave/orm/activerecord'
require 'prawn'

class Student < ActiveRecord::Base
  attr_accessible :barcode_number, :can_text, :cell_phone, :date_of_birth, :email, :first_name, :grade, :household_id, :is_male, :last_name, :photo, :status, :enrollments_attributes, :is_visitor
  before_save :reformat_phone, :assign_visitor_barcode, :avatar
  
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "200x200>", :thumb => "100x100>" }
  
  # Relationships
  belongs_to :household
  has_many :attendances, :dependent => :delete_all
  has_many :enrollments, :dependent => :delete_all
  has_many :events, :through => :attendances
  has_many :notes, :as => :notable, :dependent => :destroy
  belongs_to :school
  
  # Nested Attributes
  accepts_nested_attributes_for :enrollments, :allow_destroy => true
  accepts_nested_attributes_for :household
  
  #Validations
  validates_presence_of :first_name, :last_name
  validates_presence_of :grade, :date_of_birth, :barcode_number, unless: Proc.new { |s| s.is_visitor}
  validates :date_of_birth, :timeliness => {:on_or_before => lambda { Date.current }, :type => :date}, unless: Proc.new { |s| s.is_visitor}
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}$/, :allow_blank => true, :message => "should be 10 digits (area code needed) and delimited with dashes or spaces only"
  #/^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :allow_blank => true, :message => "is not a valid format"
  validates_numericality_of :grade, :only_integer => true, :message => "is not a valid number"
  validates_inclusion_of :grade, :in => 1..12, :message => "grades are between 1 and 12"
  validates_format_of :barcode_number, :with => /^\d{12}$/, :message => 'should be 12 digits', :allow_blank => true, :if => :is_visitor
  validates_uniqueness_of :barcode_number

  #validate :one_form_of_contact_is_required
  #validate :any_present?
  validates_associated :household
  validates_associated :enrollments

  #Scopes
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :alphabetical, order('last_name, first_name')
  scope :is_visitor, where('is_visitor =?', true)
  scope :not_visitor, where('is_visitor = ? ', false)
  scope :new_student, where('created_at > ? ', 1.week.ago)
  scope :new_visitor, where('created_at > ? ', 1.week.ago)
  
  #Misc constants
  STATUS_LIST = [['Active', 'Active'],['Inactive', 'Inactive'],['College', 'College'], ['Graduated', 'Graduated'], ['Missing', 'Missing']]
  
  GRADE_LIST = [['1', '1'], ['2' ,'2'], ['3', '3'], ['4', '4'], ['5', '5'], ['6', '6'], ['7', '7'], ['8', '8'], ['9 (Freshman)', '9'], 
  ['10 (Sophomore)', '10'], ['11 (Junior)','11'], ['12 (Senior)', '12']]

  #Other methods
  
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end
  
  def image
    if self.is_male
      "male.jpg"
    else
      "female.jpg"
    end
  end
    
  def age
    (Time.now.to_s(:number).to_i - date_of_birth.to_time.to_s(:number).to_i)/10e9.to_i
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
    
  def recent_activity
    Student.joins('INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id INNER JOIN section_events se ON se.event_id = e.id INNER JOIN sections ON sections.id = se.section_id INNER JOIN programs ON sections.program_id=programs.id').
    where('students.id = ? AND e.date > ?', self.id, 1.month.ago.to_date).select('sections.name AS "section",programs.name AS "program",e.id AS "event", e.date AS "date"').order('"date"')
    
    #Student.joins('INNER JOIN attendances a ON a.student_id = students.id INNER JOIN events e ON e.id = a.event_id').
    #where('students.id = ? AND e.date > ?', self.id, 5.days.ago.to_date).select('students.last_name AS "ln", e.id AS "event", e.date AS "date"')
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
  def assign_visitor_barcode
    if self.is_visitor
      @student = true
      while @student
        new_barcode = '00000'+Array.new(7){rand(10)}.join
        @student = Student.find_by_barcode_number(new_barcode)
        if @student.nil?
          self.barcode_number = new_barcode
          @student = false
        else
          @student = true
        end  
      end
    end
  end


  #For visitors, we require at least one form of contact: street, cellphone, or email
  private
    def any_present?
      if self.is_visitor?
        if %w(cell_phone email).all?{|attr| self[attr].blank?}
           errors.add(:cell_phone, "fill in one of the following: cell phone, email")
           errors.add(:email, "fill in one of the following: cell phone, email")
        end
      end
    end


  # # For visitors, we need at least one form of contact from street, cellphone, or email
  # def one_form_of_contact_is_required
  #   if self.is_visitor
  #     if (self.cell_phone.blank? and self.email.blank?)
  #     #one at least must be filled in, add a custom error message
  #       #errors.add(:base, 'we need one of the following: cellphone, email')
  #       return false
  #     else
  #       return true
  #     end
  #   end
  #end

  #CRON job
  
  def self.change_grade
    graduated_students = Student.where('grade = ? AND status = ?',12, 'Active')
    graduated_students.each do |s|
      s.update_attributes(:status => 'Inactive')
    end
    
    not_graduated_students = Student.where('grade != ?', 12)
    not_graduated_students.each do |s| 
      gr = s.grade
      new_grade = gr +1
      s.update_attributes(:grade => new_grade) 
    end
  end
  
end
