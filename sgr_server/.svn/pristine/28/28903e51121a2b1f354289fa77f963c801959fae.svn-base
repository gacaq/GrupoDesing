require 'test_helper'

class VariableRangesControllerTest < ActionController::TestCase
  setup do
    @variable_range = variable_ranges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:variable_ranges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create variable_range" do
    assert_difference('VariableRange.count') do
      post :create, variable_range: { recipe_id: @variable_range.recipe_id, value_max: @variable_range.value_max, value_min: @variable_range.value_min, variable_id: @variable_range.variable_id }
    end

    assert_redirected_to variable_range_path(assigns(:variable_range))
  end

  test "should show variable_range" do
    get :show, id: @variable_range
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @variable_range
    assert_response :success
  end

  test "should update variable_range" do
    put :update, id: @variable_range, variable_range: { recipe_id: @variable_range.recipe_id, value_max: @variable_range.value_max, value_min: @variable_range.value_min, variable_id: @variable_range.variable_id }
    assert_redirected_to variable_range_path(assigns(:variable_range))
  end

  test "should destroy variable_range" do
    assert_difference('VariableRange.count', -1) do
      delete :destroy, id: @variable_range
    end

    assert_redirected_to variable_ranges_path
  end
end
