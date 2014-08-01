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
    @user_sim_datum = UserSimDatum.new
    @simulation_data = @simulation.simulation_datums
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
