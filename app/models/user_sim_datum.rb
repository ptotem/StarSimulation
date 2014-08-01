class UserSimDatum < ActiveRecord::Base

  #validates_uniqueness_of :simulation_datum_id, :scope => [:user_id, :simulation_id], :message => "You already have selected this program."

  belongs_to :simulation
  belongs_to :user

end
