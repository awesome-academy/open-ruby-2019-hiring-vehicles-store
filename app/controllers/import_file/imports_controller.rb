class ImportFile::ImportsController < ApplicationController
  def create
    Vehicle.imports params[:file]
    redirect_to admin_vehicles_path
    flash[:success] = t ".success"
  end
end
