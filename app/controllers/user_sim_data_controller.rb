class UserSimDataController < ApplicationController
  autocomplete :simulation_datum, :programme_name, :full => true
  before_action :set_user_sim_datum, only: [:show, :edit, :update, :destroy]

  # GET /user_sim_data
  # GET /user_sim_data.json
  def index
    @user_sim_data = UserSimDatum.all
  end

  # GET /user_sim_data/1
  # GET /user_sim_data/1.json
  def show
  end

  # GET /user_sim_data/new
  def new
    @user_sim_datum = UserSimDatum.new
  end

  # GET /user_sim_data/1/edit
  def edit
  end

  # POST /user_sim_data
  # POST /user_sim_data.json
  def create
    @user_sim_datum = UserSimDatum.new(user_sim_datum_params)
    #render :json => params
    #return

    respond_to do |format|
      if @user_sim_datum.save
        format.html { redirect_to '/', notice: 'User sim datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @new_user_sim_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_sim_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_sim_data/1
  # PATCH/PUT /user_sim_data/1.json
  def update
    respond_to do |format|
      if @user_sim_datum.update(user_sim_datum_params)
        format.html { redirect_to @user_sim_datum, notice: 'User sim datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_sim_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_sim_data/1
  # DELETE /user_sim_data/1.json
  def destroy
    @user_sim_datum.destroy
    respond_to do |format|
      format.html { redirect_to user_sim_data_url }
      format.json { head :no_content }
    end
  end

  def play_simulation
    @simulation = Simulation.find(params[:simulation_id])
    #@simulation.user_sim_datums.build
    @user_sim_datum = UserSimDatum.new
    @simulation_data = @simulation.simulation_datums
  end

  def result
    @simulation = params[:simulation_id]
    @simulation_og = Simulation.find(@simulation)
    # render :json => @simulation_og
    # return
    # @user_sim_data = SimulationUserData.where(:user_id=>current_user.id, :simulation_id=>params[:simulation_id]).last
    # # render :json => @user_sim_data
    # # return
    # @user_sim_datum = UserSimDatum.where(:user_id=>current_user.id, :simulation_id=>params[:simulation_id])
    # @total_slots_bought = 0
    # @user_sim_datum.each do |user_sim_data|
    #   @total_slots_bought = @total_slots_bought + user_sim_data.no_of_slots
    # end
    @no_of_attempts = current_user.simulation_user_datas.where(:simulation_id=>params[:simulation_id]).count
    gon.no_of_attempts = @no_of_attempts

    @sim_user_data = current_user.simulation_user_datas.where(:simulation_id=>params[:simulation_id])
    @user_sim_data = UserSimDatum.where(:user_id=>current_user.id, :simulation_id=>params[:simulation_id]).group(:play_count)
    @sample_array = Array.new()
    @sim_user_data.each_with_index do |sud, index|
      @sample_array << UserSimDatum.where(:user_id=>current_user.id, :simulation_id=>params[:simulation_id], :play_count=>index+1).map{|usd| usd.no_of_slots}
    end
    @inner = Array.new()
    @sample_array.each do |sa|
      @inner << sa.length
    end
    # render :json => @inner
    # return

    # from here correct
    @individual_grp_mapped = current_user.simulation_user_datas.where(:simulation_id=>params[:simulation_id]).map{|sud| sud.total_grp}
    @individual_grp = current_user.simulation_user_datas.where(:simulation_id=>params[:simulation_id])
    @individual_grp_array = Array.new()
    @individual_grp.each_with_index do |ig, index|
      igrp_point = index+1, ig.total_grp rescue 0
      c = igrp_point.to_a
      @individual_grp_array << igrp_point
    end

    @individual_cprp_mapped = current_user.simulation_user_datas.where(:simulation_id=>params[:simulation_id]).map{|sud| sud.total_cprp}
    @individual_cprp = current_user.simulation_user_datas.where(:simulation_id=>params[:simulation_id])
    @individual_cprp_array = Array.new()
    @individual_cprp.each_with_index do |ic, index|
      icprp_point = index+1, ic.total_cprp rescue 0
      c = icprp_point.to_a
      @individual_cprp_array << icprp_point
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_sim_datum
      @user_sim_datum = UserSimDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_sim_datum_params
      params.require(:user_sim_datum).permit(:user_id, :simulation_id, :simulation_datum_id, :no_of_slots)
    end
end
