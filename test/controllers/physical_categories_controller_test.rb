require 'test_helper'

class PhysicalCategoriesControllerTest < ActionController::TestCase
  setup do
    @physical_category = physical_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:physical_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create physical_category" do
    assert_difference('PhysicalCategory.count') do
      post :create, physical_category: { name: @physical_category.name }
    end

    assert_redirected_to physical_category_path(assigns(:physical_category))
  end

  test "should show physical_category" do
    get :show, id: @physical_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @physical_category
    assert_response :success
  end

  test "should update physical_category" do
    patch :update, id: @physical_category, physical_category: { name: @physical_category.name }
    assert_redirected_to physical_category_path(assigns(:physical_category))
  end

  test "should destroy physical_category" do
    assert_difference('PhysicalCategory.count', -1) do
      delete :destroy, id: @physical_category
    end

    assert_redirected_to physical_categories_path
  end
end
