require 'test_helper'

class VolunteerTrainingTest < ActiveSupport::TestCase

    should belong_to(:volunteer)
    should belong_to(:training)

    #Test validations
    should validate_presence_of(:date)

end
