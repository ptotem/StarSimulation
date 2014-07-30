class UserSimDatum < ActiveRecord::Base

  belongs_to :simulation
  belongs_to :user

end
