class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_sim_datums

  has_many :simulation_user_datas
  has_many :simulations, :through => :simulation_user_datas


  def set_budget
    sim_user_data = self.simulation_user_datas.build
    sim_user_data.budget = 100
    sim_user_data.save!
    self.save!
  end

end
