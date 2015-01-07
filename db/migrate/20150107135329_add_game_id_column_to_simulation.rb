class AddGameIdColumnToSimulation < ActiveRecord::Migration
  def change
    add_column :simulations, :game_id, :integer
  end
end
