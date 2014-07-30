class AddSimulationIdAndSimulationDatumIdAndNoOfSlotsToUserSimData < ActiveRecord::Migration
  def change
    add_column :user_sim_data, :simulation_id, :integer
    add_column :user_sim_data, :simulation_datum_id, :integer
    add_column :user_sim_data, :no_of_slots, :integer
  end
end
