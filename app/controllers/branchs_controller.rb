class BranchsController < ApplicationController
  def index
    @branchs = Branch.all
  end

  def show
    @branch = Branch.find_by id: params[:id]
    per_page = params[:per_page] || Settings.per_page
    @vehicles = @branch.vehicles.active_vehicles
      .page(params[:page]).per per_page
    respond_to do |format|
      format.html 
      format.js
    end
  end
end
