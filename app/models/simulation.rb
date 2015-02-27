class Simulation < ActiveRecord::Base

  has_attached_file :excel_file#, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # validates_attachment_content_type :excel_file, :content_type => ["application/xls","application/xlsx"]
  validates_attachment_content_type :excel_file,
  :content_type => ["application/pdf","application/vnd.ms-excel",
                    "application/xls","application/xlsx",
                    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                    "application/msword",
                    "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                    "text/plain"]

  #accepts_nested_attributes_for :simulation_datums, :allow_destroy => true
  # belongs_to :game
  has_many :simulateresults
  # has_many :users
  belongs_to :game
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

  # after_create :set_user_budget
  #before_save :check_all_users_budget
  #
  # def set_user_budget
  #   User.all.each do |user|
  #     user.simulation_user_datas.build(:simulation_id => self.id, :budget=>10000000, :budget_available=>10000000)
  #     user.save!
  #   end
  # end
  #
  # def check_user_budget(user)
  #   puts "----user #{user}"
  #   puts user.simulation_user_datas.where(:simulation_id => self.id).first.budget_available
  #
  #   if user.simulation_user_datas.where(:simulation_id => self.id).first.budget_available < 0
  #     puts "in if"
  #     #errors.add_to_base("At least one form of contact must be entered: phone or email" )
  #     #self.errors.add(:simulation_id, "can not be nil")
  #     self.errors.add(:base, "You don't have sufficient funds.")
  #     #self.errors[:base] << "Msg"
  #     puts "errors #{self.errors}"
  #   #else
  #   #  user.save!
  #   end
  # end

end
