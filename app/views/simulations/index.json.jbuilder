json.array!(@simulations) do |simulation|
  json.extract! simulation, :id, :name
  json.url simulation_url(simulation, format: :json)
end
