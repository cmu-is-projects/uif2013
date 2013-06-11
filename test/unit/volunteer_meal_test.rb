require 'test_helper'

class VolunteerMealTest < ActiveSupport::TestCase

    should belong_to(:volunteer)
    should belong_to(:event)

end
