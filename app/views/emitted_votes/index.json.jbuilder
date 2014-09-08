json.array!(@emitted_votes) do |emitted_vote|
  json.extract! emitted_vote, :id, :user_id, :category_id, :candidate_id
  json.url emitted_vote_url(emitted_vote, format: :json)
end
