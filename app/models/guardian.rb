class Guardian < ActiveRecord::Base
  attr_accessible :active, :can_text, :cell_phone, :email, :first_name, :guardian_type, :household_id, :last_name

  before_save :reformat_phone
  #Relationships
  belongs_to :household
  has_many :notes, :as => :notable, :dependent => :destroy
  

  #Validations
  validates_presence_of :first_name, :last_name, :guardian_type, :household_id
  validates_format_of :cell_phone, :with => /^\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}$/, :message => "should be 10 digits (area code needed) and delimited with dashes only"
  validates_format_of :email, :with => /^[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid format"
    
  #scope
  scope :alphabetical,   order("last_name, first_name")
  scope :dmetaphone, lambda {|term| where("DMETAPHONE(first_name) = DMETAPHONE(?) OR DMETAPHONE(last_name) = DMETAPHONE(?)", "#{term}", "#{term}")}
  scope :levenshtein, lambda {|term| where("(first_name ~* ? OR last_name ~* ?) AND (LEVENSHTEIN(LOWER(first_name), LOWER(?)) < 3 OR LEVENSHTEIN(LOWER(last_name), LOWER(?)) < 3)", "^#{term[0].downcase}", "^#{term[0].downcase}", "#{term}", "#{term}")}
  scope :search, lambda { |term| where('first_name LIKE ? OR last_name LIKE ?', "#{term}%", "#{term}%") }
  
  
  TYPE_LIST = [['Father', 'Father'],['Mother', 'Mother'],['Noncustodial', 'Noncustodial'], ['Grandparent', 'Grandparent'], ['Fosterparent', 'Fosterparent']]
  
  def name
    "#{last_name}, #{first_name}"
  end
  
  def proper_name
    "#{first_name} #{last_name}"
  end

  def my_children
    self.household.students
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
