class AddBudgetAvailableToSimulationUserData < ActiveRecord::Migration
  def change
    add_column :simulation_user_data, :budget_available, :integer
  end
end
