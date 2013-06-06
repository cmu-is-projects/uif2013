require 'test_helper'

class SchoolTest < ActiveSupport::TestCase
  should belong_to(:location)
  should have_many(:students)
  should validate_presence_of(:name)
  should validate_presence_of(:location_id)
  should validate_numericality_of(:location_id)
  
  should validate_numericality_of(:min_grade)
  should validate_numericality_of(:max_grade)
  
  should allow_value("public").for(:category)
  should allow_value("private").for(:category)
  should allow_value("catholic").for(:category)
  should allow_value("charter").for(:category)
  should_not allow_value("bad").for(:category)
  should_not allow_value(1).for(:category)
  
  should allow_value("412.338.1414").for(:phone)
  should allow_value("412-338-1414").for(:phone)
  should allow_value("4123381414").for(:phone)
  should allow_value("412 338 1414").for(:phone)
  should_not allow_value("threefourfive").for(:phone)
  should_not allow_value("123-4567").for(:phone)
end
