class AddCostPerSlotToSimulationDatum < ActiveRecord::Migration
  def change
    add_column :simulation_data, :cost_per_slot, :integer
  end
end
