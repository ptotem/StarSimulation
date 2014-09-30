class SimulationUserData < ActiveRecord::Base
    belongs_to :simulation
    belongs_to :user

    # validates_uniqueness_of :simulation_id, :scope => [:user_id], :message => "This user is already allotted simulation."
    validates :budget_available, :numericality => {greater_than: 0, :message => "Your budget can't go below 0."}

    #validate :validate_amount_left
    #validate :my_method
    #before_save :my_method



    def check_here(user_sim_data_selected, sim_id)
      puts "in check_here"
      puts "self.id :- #{self.id}"
      #puts "user_sim_data_selected.size :- #{user_sim_data_selected.size()}"
      #puts user_sim_data_selected
      sim_data_id = 0
      slots_baught = 0
      cost_per_slot = 0
      total_spent = 0
      ba = 0
      tvr = 0, cprp = 0

      user_sim_data_selected.size().times do |x|
        sim_data_id = user_sim_data_selected[x].split("||")[0]
        slots_baught = user_sim_data_selected[x].split("||")[1]
        puts "sim_data_id :- #{sim_data_id}"
        puts "slots_baught :- #{slots_baught}"
        cost_per_slot = SimulationDatum.find(sim_data_id).cost_per_slot

        puts "cost_per_slot #{cost_per_slot}"

        total_spent = (total_spent.to_i) + ((cost_per_slot.to_i)*(slots_baught.to_i))

      end
      ba = self.budget - total_spent
      puts "ba :- #{ba}"
      puts "self.user_id :- #{self.user_id}"

      if ba < 0
        self.errors.add(:base, "Budget can't be less than 0")
      else
        self.budget_available = ba
        self.save
      end

    end

    def set_cprp_and_grp(user_sim_data_selected, sim_id)
      total_grp = 0
      total_cprp = 0
      total_spent = 0
      total_slots_bought = 0
      user_sim_data_selected.size().times do |x|
        sim_data_id = user_sim_data_selected[x].split("||")[0]
        slots_baught = user_sim_data_selected[x].split("||")[1]
        total_slots_bought = total_slots_bought + slots_baught.to_i
        user_sim_data = UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id, :simulation_datum_id=>sim_data_id).first

        puts "user_sim_data.id :- #{user_sim_data.id}"
        cost_per_slot = SimulationDatum.find(sim_data_id).cost_per_slot
        tvr = SimulationDatum.find(sim_data_id).tvr
        amt = ((cost_per_slot.to_i)*(slots_baught.to_i))
        puts "amt :- #{amt}"
        cprp = (amt/tvr).round(2)
        grp = ((slots_baught.to_i)*(tvr))
        # puts "user_sim_data.id :- #{user_sim_data.id}"
        puts "in set_cprp_and_grp"
        puts "sim_id :- #{sim_id}"
        puts "cost_per_slot :- #{cost_per_slot}"
        puts "sim_data_id :- #{sim_data_id}"
        puts "slots_baught :- #{slots_baught}"
        puts "tvr :- #{tvr}"
        puts "cprp :- #{cprp}"
        puts "grp :- #{grp}"
        user_sim_data.cprp = cprp
        user_sim_data.grp = grp
        # user_sim_data.play_count = UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id).last.play_count + 1 rescue 1
        # user_sim_data.play_count = BUserSimData.where(:user_id => self.user.id, :simulation_id => sim_id).last.play_count + 1 rescue 1
        user_sim_data.play_count = SimulationUserData.where(:user_id => self.user.id, :simulation_id => sim_id).count rescue 1
        puts "if condition starts"
        puts "UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id).count #{UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id).count}"
        # if UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id).count == 0
        #   puts "if count 0"
        #   # user_sim_data_current = UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id, :simulation_datum_id=>sim_data_id)
        #   # user_sim_data_current.play_count = 1
        #   # user_sim_data_current.save!
        #   user_sim_data.play_count = 1
        # else
        #   puts "else"
        # #   user_sim_data_current = UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id, :simulation_datum_id=>sim_data_id)
        # #   last_play_count = UserSimDatum.where(:user_id => self.user.id, :simulation_id => sim_id).last.play_count
        # #   user_sim_data_current.play_count = last_play_count + 1
        # end

        # UserSimDatum.where(:user_id=>self.user.id, :simulation_id=>sim_id).destroy_all
        # puts "copy_all_data[0] #{copy_all_data.first}"
        # puts "copy_all_data[0].user_id #{copy_all_data.first.user_id}"
        # copy_all_data.count.times do |cd|
        #   @cp = UserSimDatum.create(:user_id=>cd.user_id, :simulation_id=>cd.simulation_id, :simulation_datum_id=>cd.simulation_datum_id, :no_of_slots=>cd.no_of_slots, :budget_available=>cd.budget_available, :cprp=>cd.cprp, :grp=>cd.grp, :play_count=>cd.play_count)
        #   @cp.save!
        # end

        total_grp = total_grp + grp
        total_spent = (total_spent.to_i) + ((cost_per_slot.to_i)*(slots_baught.to_i))
        user_sim_data.save
      end
      copy_all_data = BUserSimData.where(:user_id => self.user.id, :simulation_id => sim_id)
      copy_all_data.each do |cd|
        @cp = UserSimDatum.create(:user_id=>cd.user_id, :simulation_id=>cd.simulation_id, :simulation_datum_id=>cd.simulation_datum_id, :no_of_slots=>cd.no_of_slots, :budget_available=>cd.budget_available, :cprp=>cd.cprp, :grp=>cd.grp, :play_count=>cd.play_count)
        @cp.save!
      end
      BUserSimData.where(:user_id=>self.user.id, :simulation_id=>sim_id).destroy_all
      # set_all = UserSimDatum.where(:user_id => self.user.id, :simulation_datum_id=>sim_data_id)
      # set_all.simulation_id = sim_id
      # set_all.save!
      puts "in set_cprp_and_grp, self.id :- #{self.id}"
      puts "total_grp :- #{total_grp.round(2)}"
      self.total_grp = (total_grp).round(2)
      total_cprp = (total_spent/total_grp).round(2)
      puts "total_cprp :- #{total_cprp}"
      self.total_cprp = total_cprp
      self.score = ( ((0.5)*(total_grp)) + ((0.5)*(total_cprp)) )
      puts "total_slots_bought :- #{total_slots_bought}"
      check_simulation = Simulation.find(sim_id)
      simulation_spot = check_simulation.sim_spot
      simulation_grp = check_simulation.sim_grp
      simulation_cprp = check_simulation.sim_cprp
      puts "simulation_spot :- #{simulation_spot}, simulation_grp :- #{simulation_grp}, simulation_cprp :- #{simulation_cprp}"
      # penalty = ( ((110)-(total_slots_bought)) + ((369)-(total_grp)) + ((27379)-(total_cprp)) )
      penalty = ( ((simulation_spot)-(total_slots_bought)) + ((simulation_grp)-(total_grp)) + ((simulation_cprp)-(total_cprp)) )
      puts "points :- #{points}"
      self.points = 100000 - penalty
      self.save!
    end

    def my_method
      puts "in my_method"
      puts "self.id #{self.id}"
      this_user_sim_data = UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id)
      puts "this_user_sim_data :- #{this_user_sim_data}"
      this_user_sim_data.each do |individual_sim_data|
        puts "individual_sim_data.id #{individual_sim_data.id}"
        puts "individual_sim_data.no_of_slots #{individual_sim_data.no_of_slots}"
      end
    end

    def validate_amount_left
      puts "self.budget_available :-  #{self.budget_available}"
      #this_user_sim_data = UserSimDatum.where(:simulation_id => self.simulation_id, :user_id=>self.user_id)
      #amount_left = self.budget_available

      initial_budget = self.budget
      amount_left = initial_budget

      this_user_sim_data = UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id)

      puts "all together, simulation_datum_id :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.simulation_datum_id}}"
      puts "all together, no_of_slots :- #{UserSimDatum.where("simulation_id = ? AND user_id = ?", self.simulation_id, self.user_id).map{|i| i.no_of_slots}}"

      #this_user_sim_data.each do |individual_sim_data|
      #  puts "slots taken :- #{individual_sim_data.no_of_slots}"
      #  puts "cost_per_slot #{SimulationDatum.find(individual_sim_data.simulation_datum_id).cost_per_slot}"
      #  amount_left = amount_left - ((SimulationDatum.find(individual_sim_data.simulation_datum_id).cost_per_slot) * (individual_sim_data.no_of_slots))
      #end

      #puts "amount_left :- #{amount_left}"
      #
      #if amount_left < 0
      #    self.errors.add(:base, "Budget can't be less than 0")
      #else
      #  puts "else budget_available #{self.budget_available}"
      #  puts "else amount_left #{amount_left}"
      #  self.budget_available = amount_left
      ##  self.save
      #end

      #if self.budget_available < 0
      #  self.errors.add(:base, "Budget can't be less than 0")
      #end
    end

end
