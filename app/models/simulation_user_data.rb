class SimulationUserData < ActiveRecord::Base
    belongs_to :simulation
    belongs_to :user

    #validates_uniqueness_of :simulation_id, :scope => [:user_id], :message => "This user is already allotted simulation."
    #validates :budget_available, :numericality => {greater_than: 0, :message => "Your budget can't go below 0."}

    validate :something

    def something
      puts "hello"
      puts "self.budget_available :-  #{self.budget_available}"
      #this_user_sim_data = UserSimDatum.where(:simulation_id => self.simulation_id, :user_id=>self.user_id)
      #amount_left = self.budget_available
      initial_budget = self.budget
      amount_left = initial_budget
      this_user_sim_data = UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id)
      puts "all together, simulation_datum_id :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.simulation_datum_id}}"
      puts "all together, no_of_slots :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.no_of_slots}}"
      this_user_sim_data.each do |individual_sim_data|
        puts "slots taken :- #{individual_sim_data.no_of_slots}"
        puts "cost_per_slot #{SimulationDatum.find(individual_sim_data.simulation_datum_id).cost_per_slot}"
        amount_left = amount_left - ((SimulationDatum.find(individual_sim_data.simulation_datum_id).cost_per_slot) * (individual_sim_data.no_of_slots))
      end
      puts "amount_left :- #{amount_left}"

      if amount_left < 0
          self.errors.add(:base, "Budget can't be less than 0")
      else
        puts "else budget_available #{self.budget_available}"
        puts "else amount_left #{amount_left}"
        self.budget_available = amount_left
      #  self.save
      end
      #if self.budget_available < 0
      #  self.errors.add(:base, "Budget can't be less than 0")
      #end
    end

end
