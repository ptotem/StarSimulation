json.array!(@simulation_data) do |simulation_datum|
  json.extract! simulation_datum, :id
  json.url simulation_datum_url(simulation_datum, format: :json)
end
