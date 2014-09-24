class AddScoreToSimulationUserData < ActiveRecord::Migration
  def change
    add_column :simulation_user_data, :score, :integer
  end
end
