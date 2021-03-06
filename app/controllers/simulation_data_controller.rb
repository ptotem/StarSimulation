class SimulationDataController < ApplicationController
  before_action :set_simulation_datum, only: [:show, :edit, :update, :destroy]

  # GET /simulation_data
  # GET /simulation_data.json
  def index
    @simulation_data = SimulationDatum.all
  end

  # GET /simulation_data/1
  # GET /simulation_data/1.json
  def show
  end

  # GET /simulation_data/new
  def new
    @simulation_datum = SimulationDatum.new
  end

  # GET /simulation_data/1/edit
  def edit
  end

  # POST /simulation_data
  # POST /simulation_data.json
  def create
    @simulation_datum = SimulationDatum.new(simulation_datum_params)

    respond_to do |format|
      if @simulation_datum.save
        format.html { redirect_to @simulation_datum, notice: 'Simulation datum was successfully created.' }
        format.json { render action: 'show', status: :created, location: @simulation_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @simulation_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /simulation_data/1
  # PATCH/PUT /simulation_data/1.json
  def update
    respond_to do |format|
      if @simulation_datum.update(simulation_datum_params)
        format.html { redirect_to @simulation_datum, notice: 'Simulation datum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @simulation_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /simulation_data/1
  # DELETE /simulation_data/1.json
  def destroy
    @simulation_datum.destroy
    respond_to do |format|
      format.html { redirect_to simulation_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation_datum
      @simulation_datum = SimulationDatum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_datum_params
      params[:simulation_datum]
    end
end
