class AddTotalCprpToSimulationUserData < ActiveRecord::Migration
  def change
    add_column :simulation_user_data, :total_cprp, :integer
  end
end
