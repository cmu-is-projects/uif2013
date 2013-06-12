require 'uri'
require 'net/http'
require 'net/https'
require 'json'

class Household < ActiveRecord::Base
  attr_accessible :active, :church, :city, :insurance_company, :insurance_number, :lat, :lon, :name, :street, :street2, :zip

  before_save :create_map_link

  # Relationships
  has_many :guardians
  has_many :students
  has_many :volunteers
  has_many :notes, :as => :notable, :dependent => :destroy

  #Validations
  validates_presence_of :name, :street, :zip
  validates_format_of :zip, :with => /^\d{5}(\-\d{4})?$/, :message => "should be five digits long"
  validates_numericality_of :lat, :lon, :allow_blank => true
  
  #Scopes
  scope :alphabetical,   order("name")
  scope :active, where('active = ?', true)
  scope :inactive, where('active = ?', false)
  scope :missing_info, where('insurance_number = ?', "")

  # Callbacks
  before_validation :get_household_coordinates
  
  def create_map_link(zoom=12,width=800,height=800)
      to_s()
      markers = ""; i = 1   
      markers += "&markers=color:red%7Ccolor:red%7Clabel:#{i}%7C#{self.lat},#{self.lon}"  
      map = "http://maps.google.com/maps/api/staticmap?center= #{self.lat},#{self.lon}&zoom=#{zoom}&size=#{width}x#{height}&maptype=roadmap#{markers}&sensor=false"
  end

  def to_s
    str = self.street
    zip = self.zip
    #Search for city, state, country
    res = Net::HTTP.get_response(URI.parse('http://ziptasticapi.com/'+zip.to_s()))
    map = JSON.parse(res.body)
    state = map["state"]
    city = map["city"]
    coord = Geocoder.coordinates("#{str}, #{city}, #{state}")
    if coord
      self.lat = coord[0]
      self.lon = coord[1]
    else 
      errors.add(:base, "Error with geocoding")
    end
    return "#{self.lat}, #{self.lon}"
  end

  # private
  # def get_household_coordinates
  #   str = self.street
  #   zip = self.zip
    
  #   coord = Geocoder.coordinates("#{str}, #{zip}")
  #   if coord
  #     self.lat = coord[0]
  #     self.lon = coord[1]
  #   else 
  #     errors.add(:base, "Error with geocoding")
  #   end
  #   return coord
  # end
  
end
