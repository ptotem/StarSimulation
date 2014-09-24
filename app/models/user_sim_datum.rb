class UserSimDatum < ActiveRecord::Base

  # validates_uniqueness_of :simulation_datum_id, :scope => [:user_id, :simulation_id], :message => "You already have selected this program."
  # validates_uniqueness_of :simulation_datum_id, scope: [:user_id, :simulation_id]

  belongs_to :simulation
  belongs_to :user

  #before_save :my_method_usd
  #validate :my_method_usd

  def backup_prev_data(prev_data, user_id, sim_id)
    puts "backup_prev_data :- #{prev_data}"
    BUserSimData.where(:user_id=>user_id, :simulation_id=>sim_id).destroy_all
    prev_data.each do |pd|
      @b = BUserSimData.create(:user_id=>pd.user_id, :simulation_id=>pd.simulation_id, :simulation_datum_id=>pd.simulation_datum_id, :no_of_slots=>pd.no_of_slots, :budget_available=>pd.budget_available, :cprp=>pd.cprp, :grp=>pd.grp, :play_count=>pd.play_count)
      @b.save!
    end

    # return prev_data
  end

  def my_method_usd
    puts "UserSimDatum"
    puts "in my_method_usd"
    puts "self.id #{self.id}"
    new_array = Array.new()
    new_array << self.id
    puts "new_array :- #{new_array}"
    #puts "all together, simulation_datum_id :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.simulation_datum_id}}"
    #puts "all together, no_of_slots :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.no_of_slots}}"
  end


end
