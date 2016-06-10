json.array!(@filters) do |filter|
  json.extract! filter, :id, :name, :query, :value
  json.url filter_url(filter, format: :json)
end
