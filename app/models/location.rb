class Location < ActiveRecord::Base
  attr_accessible :active, :city, :lat, :lon, :name, :street, :zip

  before_save :create_map_link

  #Relationships
  has_many :events
  has_many :programs, :through => :events
  has_many :notes, :as => :notable, :dependent => :destroy
  has_one :school

  #Validations
  validates_presence_of :name, :street, :city, :zip
  validates_uniqueness_of :name
  validates_format_of :zip, :with => /^\d{5}(\-\d{4})?$/, :message => "should be five digits long"
  # validates_numericality_of :lat, :lon, :allow_blank => true, :allow_nil => true;
  
  # Scopes
  scope :alphabetical, order('name')
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)

  
  # Callbacks
  before_validation :get_location_coordinates
  
  def create_map_link(zoom=12,width=800,height=800)
      markers = ""; i = 1   
      markers += "&markers=color:red%7Ccolor:red%7Clabel:#{i}%7C#{lat},#{lon}"  
      map = "http://maps.google.com/maps/api/staticmap?center= #{lat},#{lon}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
  end

  def to_s
    return "#{self.lat},#{self.lon}"
  end

private
  def get_location_coordinates
    str = self.street
    zip = self.zip
    
    coord = Geocoder.coordinates("#{str}, #{zip}")
    if coord
      self.lat = coord[0]
      self.lon = coord[1]
    else 
      errors.add(:base, "Error with geocoding")
    end
    coord
  end
 

end
