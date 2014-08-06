class UserSimDatum < ActiveRecord::Base

  #validates_uniqueness_of :simulation_datum_id, :scope => [:user_id, :simulation_id], :message => "You already have selected this program."
  #validates :age_min, :numericality => {greater_than: 0, less_than_or_equal_to: :age_max}, :unless => Proc.new {|user| user.age_min.nil? || user.age_max.nil? }

  belongs_to :simulation
  belongs_to :user

end
