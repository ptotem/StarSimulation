class CreateSimulationresults < ActiveRecord::Migration
  def change
    create_table :simulationresults do |t|
      t.string :attempt
      t.string :status

      t.timestamps
    end
  end
end
