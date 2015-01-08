class AddGameIdToSimulation < ActiveRecord::Migration
  def change
    add_column :simulation, :game_id, :integer
  end
end
