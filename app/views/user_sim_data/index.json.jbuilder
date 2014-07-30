json.array!(@user_sim_data) do |user_sim_datum|
  json.extract! user_sim_datum, :id, :user_id
  json.url user_sim_datum_url(user_sim_datum, format: :json)
end
