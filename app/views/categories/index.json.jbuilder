json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :bench, :selection_process_id
  json.url category_url(category, format: :json)
end
