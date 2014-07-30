class CreateUserSimData < ActiveRecord::Migration
  def change
    create_table :user_sim_data do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
