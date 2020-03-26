class Admin::VehiclesController < ApplicationController
  layout "admin/application"
  before_action :find_vehicle, except: %i(new create index)
  before_action :load_data, except: %i(index destroy)

  def index
    @vehicles = Vehicle.select Vehicle::INDEX_PARAMS

    respond_to do |format|
      format.html
      format.csv { send_data @vehicles.as_csv }
    end
  end

  def new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new vehicle_params

    if @vehicle.save
      flash[:success] = t ".success"
      redirect_to admin_vehicles_path
    else
      flash[:danger] = t ".fails"
      render "admin/vehicles/form"
    end
  end

  def edit; end

  def update
    if @vehicle.update_attributes vehicle_params
      flash[:success] = t ".success"
      redirect_to admin_vehicles_path
    else
      flash[:danger] = t ".fails"
      render "admin/vehicles/form"
    end
  end

  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def vehicle_params
    params.require(:vehicle).permit Vehicle::VEHICLE_PARAMS
  end

  def find_vehicle
    @vehicle = Vehicle.find_by id: params[:id]

    return if @vehicle
    flash[:danger] = t ".cant_find"
    redirect_to admin_vehicles_path
  end

  def load_data
    @branchs = Branch.all
    @categories = Category.all
  end
end
