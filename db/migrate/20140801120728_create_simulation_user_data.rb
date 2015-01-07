class CreateSimulationUserData < ActiveRecord::Migration
  def change
    create_table :simulation_user_data do |t|
      t.integer :simulation_id
      t.integer :user_id
      t.integer :budget

      t.timestamps
    end
  end
end
