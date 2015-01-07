class AddGamesToSimulation < ActiveRecord::Migration
  def change
    t.belongs_to :game, index: true
  end
end
