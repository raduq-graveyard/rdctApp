json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :mail, :age, :state, :role
  json.url contact_url(contact, format: :json)
end
