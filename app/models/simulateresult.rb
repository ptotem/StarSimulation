class Simulateresult < ActiveRecord::Base
  belongs_to :user
  belongs_to :simulation
end
