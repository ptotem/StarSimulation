class AddSimSpotAndSimGrpAndSimCprpToSimulations < ActiveRecord::Migration
  def change
    add_column :simulations, :sim_spot, :integer
    add_column :simulations, :sim_grp, :integer
    add_column :simulations, :sim_cprp, :integer
  end
end
