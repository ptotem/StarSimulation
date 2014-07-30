class CreateSimulationData < ActiveRecord::Migration
  def change
    create_table :simulation_data do |t|

      t.timestamps
    end
  end
end
