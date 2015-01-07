class ChangeDataTypeForTotalCprpAndTotalGrpInSimulationUserData < ActiveRecord::Migration
  def change
    change_column :simulation_user_data, :total_cprp, :float
    change_column :simulation_user_data, :total_grp, :float
  end
end
