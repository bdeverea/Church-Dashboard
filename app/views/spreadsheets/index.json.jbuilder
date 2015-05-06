json.array!(@spreadsheets) do |spreadsheet|
  json.extract! spreadsheet, :id, :name, :description, :created_by, :modified_by, :headers, :content
  json.url spreadsheet_url(spreadsheet, format: :json)
end
