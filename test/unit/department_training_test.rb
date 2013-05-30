require 'test_helper'

class DepartmentTrainingTest < ActiveSupport::TestCase

    should belong_to(:department)
    should belong_to(:training)


end
