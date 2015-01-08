class AddUserIdToSimulateresult < ActiveRecord::Migration
  def change
    add_column :simulateresults, :user_id, :integer
  end
end
