class AddColumnPlayCountToUserSimData < ActiveRecord::Migration
  def change
    add_column :user_sim_data, :play_count, :integer
  end
end
