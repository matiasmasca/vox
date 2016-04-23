json.array!(@selection_processes) do |selection_process|
  json.extract! selection_process, :id, :name_process, :place, :duration, :start_date, :end_date, :process_type_id, :state
  json.url selection_process_url(selection_process, format: :json)
end
