class AddSimulationToGame < ActiveRecord::Migration
  def change
    t.belongs_to :simulation, index: true
  end
end
