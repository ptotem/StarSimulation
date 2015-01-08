class AddUserIdToSimulateresult < ActiveRecord::Migration
  def change
    add_column :simulateresult, :userId, :integer
  end
end
