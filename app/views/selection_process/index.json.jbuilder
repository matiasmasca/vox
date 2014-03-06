json.array!(@selection_process) do |selection_processes|
  json.extract! selection_processes, :id, :name_process, :place, :duration, :start_date, :end_date, :process_type_id, :state
  json.url selection_processes_url(selection_processes, format: :json)
end
