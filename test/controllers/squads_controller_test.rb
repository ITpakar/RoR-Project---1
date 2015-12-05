require 'test_helper'

class SquadsControllerTest < ActionController::TestCase
  setup do
    @squad = squads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:squads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create squad" do
    assert_difference('Squad.count') do
      post :create, squad: { country_id: @squad.country_id, deleted: @squad.deleted, name: @squad.name }
    end

    assert_redirected_to squad_path(assigns(:squad))
  end

  test "should show squad" do
    get :show, id: @squad
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @squad
    assert_response :success
  end

  test "should update squad" do
    patch :update, id: @squad, squad: { country_id: @squad.country_id, deleted: @squad.deleted, name: @squad.name }
    assert_redirected_to squad_path(assigns(:squad))
  end

  test "should destroy squad" do
    assert_difference('Squad.count', -1) do
      delete :destroy, id: @squad
    end

    assert_redirected_to squads_path
  end
end
