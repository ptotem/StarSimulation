class CreateBUserSimData < ActiveRecord::Migration
  def change
    create_table :b_user_sim_data do |t|
      t.integer :user_id
      t.integer :simulation_id
      t.integer :simulation_datum_id
      t.integer :no_of_slots
      t.integer :budget_available
      t.float :cprp
      t.float :grp
      t.integer :play_count

      t.timestamps
    end
  end
end
