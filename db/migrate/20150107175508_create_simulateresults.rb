class CreateSimulateresults < ActiveRecord::Migration
  def change
    create_table :simulateresults do |t|
      t.string :result

      t.timestamps
    end
  end
end
