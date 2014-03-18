require 'test_helper'

class StudentControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get payments" do
    get :payments
    assert_response :success
  end

  test "should get classes" do
    get :classes
    assert_response :success
  end

  test "should get workout_sheet" do
    get :workout_sheet
    assert_response :success
  end

end
