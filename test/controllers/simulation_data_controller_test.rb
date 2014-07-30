require 'test_helper'

class SimulationDataControllerTest < ActionController::TestCase
  setup do
    @simulation_datum = simulation_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:simulation_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create simulation_datum" do
    assert_difference('SimulationDatum.count') do
      post :create, simulation_datum: {  }
    end

    assert_redirected_to simulation_datum_path(assigns(:simulation_datum))
  end

  test "should show simulation_datum" do
    get :show, id: @simulation_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @simulation_datum
    assert_response :success
  end

  test "should update simulation_datum" do
    patch :update, id: @simulation_datum, simulation_datum: {  }
    assert_redirected_to simulation_datum_path(assigns(:simulation_datum))
  end

  test "should destroy simulation_datum" do
    assert_difference('SimulationDatum.count', -1) do
      delete :destroy, id: @simulation_datum
    end

    assert_redirected_to simulation_data_path
  end
end
