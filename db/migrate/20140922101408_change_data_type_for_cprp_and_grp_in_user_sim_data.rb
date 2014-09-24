class ChangeDataTypeForCprpAndGrpInUserSimData < ActiveRecord::Migration
  def change
    change_column :user_sim_data, :cprp, :float
    change_column :user_sim_data, :grp, :float
  end
end
