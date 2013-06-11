require 'test_helper'

class VolunteerCheckTest < ActiveSupport::TestCase

    should belong_to(:volunteer)
    should belong_to(:check)

    
end
