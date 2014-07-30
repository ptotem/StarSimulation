class AddAttachmentExcelFileToSimulations < ActiveRecord::Migration
  def self.up
    change_table :simulations do |t|
      t.attachment :excel_file
    end
  end

  def self.down
    drop_attached_file :simulations, :excel_file
  end
end
