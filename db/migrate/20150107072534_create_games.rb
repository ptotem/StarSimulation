class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.belongs_to :simulation, index: true
      t.timestamps
    end
  end
end
