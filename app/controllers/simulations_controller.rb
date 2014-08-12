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
    #render :json => params
    #return
    @usd = current_user.simulation_user_datas.where(:simulation_id=>params[:id]).first

    @new_a = Array.new()
    #params[:simulation][:user_sim_datums_attributes].each do |p|
    #  @new_a << "#{p.simulation_datum_id}-#{p.no_of_slots}"
    #end

    #render :json => params[:simulation][:user_sim_datums_attributes].keys().size()
    #return


    params[:simulation][:user_sim_datums_attributes].keys().each do |k|
      @new_a << "#{params[:simulation][:user_sim_datums_attributes]["#{k}"]["simulation_datum_id"]}||#{params[:simulation][:user_sim_datums_attributes]["#{k}"]["no_of_slots"]}"
    end

    #render :json => @new_a
    #return

    #simulation_params
    #render :json => @usd
    #return
    #@usd.user_id = current_user.id
    #
    #@simulation.update(simulation_user_datas_params)
    ##if params[:sim_user_data_budget_available].to_i < 0
    ##  flash[:notice] = "Your budget can't be less than 0."
    ##  redirect_to "/play_sim/#{params[:id]}"
    ##else
    ##render :json=> @usd
    ##return
    ##  @usd.budget_available = params[:sim_user_data_budget_available]
    #  #@usd.save!


    @usd.check_here(@new_a)
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
      redirect_to "/play_sim/#{params[:id]}", notice: 'You have successfully bought slots.'
    else
      #render :text => "fail"
      #return
      flash[:notice] = err
      redirect_to "/play_sim/#{params[:id]}"
    end
    #if @usd.save
    #  #render :json => @usd.id
    #  if @simulation.update(simulation_params)
    #  #if @simulation.update(simulation_user_datas_params)
    #    redirect_to "/play_sim/#{params[:id]}", notice: 'You have successfully bought slots.'
    #  end
    #else
    #  @usd.errors.each do |attr_name, message|
    #    err = message
    #  end
    #  render :json => @usd.errors["budget_available"][0]
    #  return
    #  flash[:notice] = @usd.errors["budget_available"][0]
    #  redirect_to "/play_sim/#{params[:id]}"
    #end
    #render :json => err
    #return

    #render :json => @usd.errors
    #return
      #@simulation.check_user_budget(current_user)
      #render :text => @simulation.errors["base"][0]
      #return
      #if !@usd.errors.blank?
      #  flash[:notice] = @usd.errors["base"][0]
      #    redirect_to "/play_sim/#{params[:id]}"
      #else
      #  respond_to do |format|
      #    if @simulation.update(simulation_params)
      #      format.html { redirect_to "/play_sim/#{params[:id]}", notice: '' }
      #      #format.html { redirect_to "/" }
      #      format.json { head :no_content }
      #    else
      #      format.html { render action: 'edit' }
      #      format.json { render json: @simulation.errors, status: :unprocessable_entity }
      #    end
      #  end
      #end


    #end



    #render :json => params[:sim_user_data_budget_available]
    #render :json => params[:sim_user_data_budget_available]
    #return

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

  def play_sim
    @simulation = Simulation.find(params[:simulation_id])
    @simulation_data = @simulation.simulation_datums
    @simulation_user_data = current_user.simulation_user_datas.where(:simulation_id=>@simulation.id).first
    @usd = current_user.simulation_user_datas.where(:simulation_id=>@simulation.id).first
    #render :json => @simulation_user_data
    #return

    #render :json => @simulation
    #return
    #@simulation.user_sim_datums.build
    #@simulation.simulation_user_datas.build
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_simulation
      @simulation = Simulation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def simulation_params
      #params.require(:simulation).permit(:name)
      #params.require(:simulation).permit(:name, user_sim_datums_attributes: [:id, :user_id, :simulation_id, :simulation_datum_id, :no_of_slots, :_destroy], simulation_user_data: [:user_id, :simulation_id])
      params.require(:simulation).permit(:name, user_sim_datums_attributes: [:id, :user_id, :simulation_id, :simulation_datum_id, :no_of_slots, :_destroy])
    end

    #def simulation_user_datas_params
    #  params.require(:simulation).permit(:name, simulation_user_datas_attributes: [:id, :user_id, :simulation_id, :_destroy])
    #end

end
