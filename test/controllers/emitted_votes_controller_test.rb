require 'test_helper'

class EmittedVotesControllerTest < ActionController::TestCase
  setup do
    @emitted_vote = emitted_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emitted_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emitted_vote" do
    assert_difference('EmittedVote.count') do
      post :create, emitted_vote: { candidate_id: @emitted_vote.candidate_id, category_id: @emitted_vote.category_id, user_id: @emitted_vote.user_id }
    end

    assert_redirected_to emitted_vote_path(assigns(:emitted_vote))
  end

  test "should show emitted_vote" do
    get :show, id: @emitted_vote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emitted_vote
    assert_response :success
  end

  test "should update emitted_vote" do
    patch :update, id: @emitted_vote, emitted_vote: { candidate_id: @emitted_vote.candidate_id, category_id: @emitted_vote.category_id, user_id: @emitted_vote.user_id }
    assert_redirected_to emitted_vote_path(assigns(:emitted_vote))
  end

  test "should destroy emitted_vote" do
    assert_difference('EmittedVote.count', -1) do
      delete :destroy, id: @emitted_vote
    end

    assert_redirected_to emitted_votes_path
  end
end
