class Simulation < ActiveRecord::Base

  has_attached_file :excel_file#, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  #validates_attachment_content_type :excel_file, :content_type => ["application/xls","application/xlsx"]
  validates_attachment_content_type :excel_file,
  :content_type => ["application/pdf","application/vnd.ms-excel",
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    "application/msword",
                    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                    "text/plain"]

  has_many :simulation_datums
  has_many :user_sim_datums

end
