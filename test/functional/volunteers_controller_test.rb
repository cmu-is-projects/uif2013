require 'test_helper'

class VolunteersControllerTest < ActionController::TestCase
  setup do
    @volunteer = volunteers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volunteers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volunteer" do
    assert_difference('Volunteer.count') do
      post :create, volunteer: { app_approved: @volunteer.app_approved, app_submit_date: @volunteer.app_submit_date, avatar_file_content_type: @volunteer.avatar_file_content_type, avatar_file_name: @volunteer.avatar_file_name, avatar_file_size: @volunteer.avatar_file_size, avatar_updated_at: @volunteer.avatar_updated_at, barcode_number: @volunteer.barcode_number, can_text: @volunteer.can_text, cell_phone: @volunteer.cell_phone, date_of_birth: @volunteer.date_of_birth, email: @volunteer.email, first_name: @volunteer.first_name, household_id: @volunteer.household_id, is_male: @volunteer.is_male, last_name: @volunteer.last_name, name_displayed: @volunteer.name_displayed, role: @volunteer.role, spouse_id: @volunteer.spouse_id, status: @volunteer.status, student_id: @volunteer.student_id }
    end

    assert_redirected_to volunteer_path(assigns(:volunteer))
  end

  test "should show volunteer" do
    get :show, id: @volunteer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volunteer
    assert_response :success
  end

  test "should update volunteer" do
    put :update, id: @volunteer, volunteer: { app_approved: @volunteer.app_approved, app_submit_date: @volunteer.app_submit_date, avatar_file_content_type: @volunteer.avatar_file_content_type, avatar_file_name: @volunteer.avatar_file_name, avatar_file_size: @volunteer.avatar_file_size, avatar_updated_at: @volunteer.avatar_updated_at, barcode_number: @volunteer.barcode_number, can_text: @volunteer.can_text, cell_phone: @volunteer.cell_phone, date_of_birth: @volunteer.date_of_birth, email: @volunteer.email, first_name: @volunteer.first_name, household_id: @volunteer.household_id, is_male: @volunteer.is_male, last_name: @volunteer.last_name, name_displayed: @volunteer.name_displayed, role: @volunteer.role, spouse_id: @volunteer.spouse_id, status: @volunteer.status, student_id: @volunteer.student_id }
    assert_redirected_to volunteer_path(assigns(:volunteer))
  end

  test "should destroy volunteer" do
    assert_difference('Volunteer.count', -1) do
      delete :destroy, id: @volunteer
    end

    assert_redirected_to volunteers_path
  end
end
