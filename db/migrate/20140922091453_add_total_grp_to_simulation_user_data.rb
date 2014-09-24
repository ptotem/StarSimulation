class AddTotalGrpToSimulationUserData < ActiveRecord::Migration
  def change
    add_column :simulation_user_data, :total_grp, :integer
  end
end
