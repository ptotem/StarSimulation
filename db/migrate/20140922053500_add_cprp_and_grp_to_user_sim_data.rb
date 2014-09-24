class AddCprpAndGrpToUserSimData < ActiveRecord::Migration
  def change
    add_column :user_sim_data, :cprp, :integer
    add_column :user_sim_data, :grp, :integer
  end
end
