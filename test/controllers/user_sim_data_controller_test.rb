require 'test_helper'

class UserSimDataControllerTest < ActionController::TestCase
  setup do
    @user_sim_datum = user_sim_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_sim_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_sim_datum" do
    assert_difference('UserSimDatum.count') do
      post :create, user_sim_datum: { user_id: @user_sim_datum.user_id }
    end

    assert_redirected_to user_sim_datum_path(assigns(:user_sim_datum))
  end

  test "should show user_sim_datum" do
    get :show, id: @user_sim_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_sim_datum
    assert_response :success
  end

  test "should update user_sim_datum" do
    patch :update, id: @user_sim_datum, user_sim_datum: { user_id: @user_sim_datum.user_id }
    assert_redirected_to user_sim_datum_path(assigns(:user_sim_datum))
  end

  test "should destroy user_sim_datum" do
    assert_difference('UserSimDatum.count', -1) do
      delete :destroy, id: @user_sim_datum
    end

    assert_redirected_to user_sim_data_path
  end
end
