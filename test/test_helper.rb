require 'simplecov'
SimpleCov.start 'rails'
ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
  def deny(condition)
    # a simple transformation to increase readability IMO
    assert !condition
  end
  
  # Context for volunteers
  def create_volunteer_contex
    @brian = FactoryGirl.create(:volunteer)
    @james = FactoryGirl.create(:volunteer, first_name: "James", last_name: "Peters", barcode_number: "111000999888")
    #@dan = FactoryGirl.create(:volunteer, first_name: "Dan", last_name: "Humphrey", barcode_number: "123098123567",app_approved: false)
  end
  
  def remove_volunteer_context
    @brian.delete
    @james.delete
    #@dan.delete
  end
  

end
