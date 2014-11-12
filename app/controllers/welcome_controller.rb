class WelcomeController < ApplicationController
  #skip_before_filter :authenticate_user!

  def index
    render :text => "welcome index"
    return
  end

  def import_simulation_data
    render :layout => false
  end

  def importing_simulation_data
    if request.post? && params[:file].present?
      SimulationDatum.import(params[:file], Simulation.find(params[:simulation_id]))
      redirect_to '/admin/simulation_datum', notice: "Simulation data imported."
    else
      redirect_to '/admin/simulation_datum', notice: "Simulation data couldn't be imported."
    end
  end

  def import_users
    render :layout => false
  end

  def importing_users
    if request.post? && params[:file].present?
      User.import(params[:file])
      redirect_to '/admin/user', notice: "Users imported."
    else
      redirect_to '/admin/user', notice: "Users couldn't be imported."
    end
  end
end
