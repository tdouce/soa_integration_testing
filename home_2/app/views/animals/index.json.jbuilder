json.array!(@animals) do |animal|
  json.extract! animal, :id, :first_name
  json.url animal_url(animal, format: :json)
end
