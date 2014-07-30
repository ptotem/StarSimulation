class AddSimulationIdToSimulationDatum < ActiveRecord::Migration
  def change
    add_column :simulation_data, :simulation_id, :integer
  end
end
