json.array!(@ballots) do |ballot|
  json.extract! ballot, :id, :selection_process_id, :category_id, :candidate_id, :digital_signature
  json.url ballot_url(ballot, format: :json)
end
