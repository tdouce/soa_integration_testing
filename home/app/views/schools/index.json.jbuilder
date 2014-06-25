json.array!(@schools) do |school|
  json.extract! school, :id, :name, :city, :state
  json.url school_url(school, format: :json)
end
