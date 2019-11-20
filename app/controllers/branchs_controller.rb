class BranchsController < ApplicationController
  def index
    @branchs = Branchs.all
  end

  def show
    @branch = Branch.find_by id: params[:id]
    @vehicles = @branch.vehicles.active_vehicles
  end
end
