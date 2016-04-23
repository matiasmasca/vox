require 'test_helper'

class BallotsControllerTest < ActionController::TestCase
  setup do
    @ballot = ballots(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:ballots)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create ballot' do
    assert_difference('Ballot.count') do
      post :create, ballot: { candidate_id: @ballot.candidate_id, category_id: @ballot.category_id, digital_signature: @ballot.digital_signature, selection_process_id: @ballot.selection_process_id }
    end

    assert_redirected_to ballot_path(assigns(:ballot))
  end

  test 'should show ballot' do
    get :show, id: @ballot
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @ballot
    assert_response :success
  end

  test 'should update ballot' do
    patch :update, id: @ballot, ballot: { candidate_id: @ballot.candidate_id, category_id: @ballot.category_id, digital_signature: @ballot.digital_signature, selection_process_id: @ballot.selection_process_id }
    assert_redirected_to ballot_path(assigns(:ballot))
  end

  test 'should destroy ballot' do
    assert_difference('Ballot.count', -1) do
      delete :destroy, id: @ballot
    end

    assert_redirected_to ballots_path
  end
end
