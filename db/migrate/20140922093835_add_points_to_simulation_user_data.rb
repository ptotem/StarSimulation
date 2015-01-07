class AddPointsToSimulationUserData < ActiveRecord::Migration
  def change
    add_column :simulation_user_data, :points, :integer
  end
end
