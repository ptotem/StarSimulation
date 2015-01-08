class AddSimulationIdToSimulateresult < ActiveRecord::Migration
  def change
    add_column :simulateresults, :simulation_id, :integer
  end
end
