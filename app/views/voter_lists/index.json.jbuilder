json.array!(@candidates) do |candidate|
  json.extract! candidate, :id, :name, :bios, :url_image
  json.url candidate_url(candidate, format: :json)
end
