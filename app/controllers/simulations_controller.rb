class SimulationsController < ApplicationController
  before_action :set_simulation, only: [:show, :edit, :update, :destroy]

  # GET /simulations
  # GET /simulations.json
  def index
    @simulations = Simulation.all
  end

  # GET /simulations/1
  # GET /simulations/1.json
  def show
  end

  # GET /simulations/new
  def new
    @simulation = Simulation.new
  end

  # GET /simulations/1/edit
  def edit
  end

  # POST /simulations
  # POST /simulations.json
  def create
    @simulation = Simulation.new(simulation_params)

    respond_to do |format|
      if @simulation.save
        format.html { redirect_to @simulation, notice: 'Simulation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @simulation }
      else
        format.html { render action: 'new' }
        format.json { render json: @simulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simulations/1
  # PATCH/PUT /simulations/1.json
  def update
    @no_slot_selected = false
    params[:simulation][:user_sim_datums_attributes].keys().each do |k|
      if params[:simulation][:user_sim_datums_attributes]["#{k}"]["no_of_slots"] == ""
        @no_slot_selected = true
      else
        if params[:simulation][:user_sim_datums_attributes]["#{k}"]["_destroy"] == "false"
          @new_a << "#{params[:simulation][:user_sim_datums_attributes]["#{k}"]["simulation_datum_id"]}||#{params[:simulation][:user_sim_datums_attributes]["#{k}"]["no_of_slots"]}"
        end

      end
    end
    # render :json => @new_a
    # return
    if @no_slot_selected == true
      # redirect_to play_sim_path(params[:id])
      respond_to do |format|
          format.html { redirect_to play_sim_path(params[:id]), notice: 'Please, select a slot.' }
      end
    else
      @usd.check_here(@new_a, params[:id])

      err = ""
      @usd.errors.each do |attr_name, message|
        err = message
      end
      #render :json => err.blank?
      #return
      if err.blank?
        @simulation.update(simulation_params)
        #render :text => "success"
        #return
        @usd.set_cprp_and_grp(@new_a, params[:id])
        # redirect_to "/play_sim/#{params[:id]}", notice: 'You have successfully bought slots.'
        redirect_to result_path(@simulation.id)
      else
        #render :text => "fail"
        #return
        flash[:notice] = err
        redirect_to "/play_sim/#{params[:id]}"
      end
    end


  end

  # DELETE /simulations/1
  # DELETE /simulations/1.json
  def destroy
    @simulation.destroy
    respond_to do |format|
      format.html { redirect_to simulations_url }
      format.json { head :no_content }
    end
  end

  def check
    @budget = 1000
  end

  def play_sim
    @simulation = Simulation.find(params[:simulation_id])
    # //TODO: Check if more than 1 users are playing, other users can see others data....
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation
      @simulation = Simulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_params
    end

end
