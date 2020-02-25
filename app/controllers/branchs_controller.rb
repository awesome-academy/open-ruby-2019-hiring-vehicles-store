class BranchsController < ApplicationController
  def index
    @branchs = Branch.all
  end

  def show
    @branch = Branch.find_by id: params[:id]
    @vehicles = @branch.vehicles.active_vehicles
      .page(params[:page]).per Settings.per_page
    respond_to do |format|
      format.html 
      format.js
    end
  end
end
