require 'test_helper'

class ModelWorkoutSheetsControllerTest < ActionController::TestCase
  setup do
    @model_workout_sheet = model_workout_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:model_workout_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create model_workout_sheet" do
    assert_difference('ModelWorkoutSheet.count') do
      post :create, model_workout_sheet: { name: @model_workout_sheet.name }
    end

    assert_redirected_to model_workout_sheet_path(assigns(:model_workout_sheet))
  end

  test "should show model_workout_sheet" do
    get :show, id: @model_workout_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @model_workout_sheet
    assert_response :success
  end

  test "should update model_workout_sheet" do
    patch :update, id: @model_workout_sheet, model_workout_sheet: { name: @model_workout_sheet.name }
    assert_redirected_to model_workout_sheet_path(assigns(:model_workout_sheet))
  end

  test "should destroy model_workout_sheet" do
    assert_difference('ModelWorkoutSheet.count', -1) do
      delete :destroy, id: @model_workout_sheet
    end

    assert_redirected_to model_workout_sheets_path
  end
end
