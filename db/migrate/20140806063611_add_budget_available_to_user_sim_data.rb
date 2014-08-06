class AddBudgetAvailableToUserSimData < ActiveRecord::Migration
  def change
    add_column :user_sim_data, :budget_available, :integer
  end
end
