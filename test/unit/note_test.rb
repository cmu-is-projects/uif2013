require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  #no relationships
  
  #validations
  should validate_numericality_of(:user_id)
  should validate_presence_of(:date)
  should validate_presence_of(:contents)
  should validate_presence_of(:notable_type)
  should validate_numericality_of(:notable_id)
  should validate_presence_of(:title)
  should validate_presence_of(:priority)
  
  #values
  should allow_value(1).for(:user_id)
  should allow_value(37).for(:user_id)
  should_not allow_value("cars").for(:user_id)
  should_not allow_value("chess").for(:user_id)
  should_not allow_value(-15).for(:user_id)
  should_not allow_value(nil).for(:user_id)
  should_not allow_value(false).for(:user_id)

  should_not allow_value(nil).for(:date)

  should_not allow_value(nil).for(:contents)
  
  should_not allow_value(nil).for(:notable_type)
  
  should allow_value(1).for(:notable_id)
  should allow_value(37).for(:notable_id)
  should_not allow_value("sports").for(:notable_id)
  should_not allow_value("music").for(:notable_id)
  should_not allow_value(-15).for(:notable_id)
  should_not allow_value(nil).for(:notable_id)
  should_not allow_value(false).for(:notable_id)
  
  should allow_value("athletics note").for(:title)
  should allow_value("art note").for(:title)
  should allow_value("student note").for(:title)
  should allow_value("guardian note").for(:title)  
  should_not allow_value(3).for(:title)
  should_not allow_value(-15).for(:title)
  should_not allow_value(nil).for(:title)
  should_not allow_value(false).for(:title)
  
  should_not allow_value(nil).for(:priority)
  
  
  
    
  # test "the truth" do
  #   assert true
  # end
  
end