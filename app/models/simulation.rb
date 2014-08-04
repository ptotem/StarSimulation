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
  #accepts_nested_attributes_for :simulation_datums, :allow_destroy => true
  has_many :user_sim_datums
  accepts_nested_attributes_for :user_sim_datums, :allow_destroy => true, reject_if: :all_blank

  has_many :simulation_user_datas
  #accepts_nested_attributes_for :simulation_user_datas, :allow_destroy => true
  has_many :users, :through => :simulation_user_datas

  #class Courses < ActiveRecord::Base
  #  has_many :courses_years
  #  has_many :years, :through => :courses_years
  #end
  #
  #class Years < ActiveRecord::Base
  #  has_many :courses_years
  #  has_many :courses, :through => :courses_years
  #end
  #
  #class CoursesYears < ActiveRecord::Base
  #  belongs_to :course
  #  belongs_to :year
  #end

end
