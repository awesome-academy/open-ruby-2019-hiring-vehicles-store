class VehiclesController < ApplicationController
  def index
    if params[:search]
      @vehicles = Vehicle.search(name_cont: params[:search]).result
      @items = @vehicles.page(params[:page]).per Settings.per_page
      respond_to :js, :html
    else
      @vehicles = Vehicle.page(params[:page]).per Settings.per_page
    end
  end

  def show
    @comment = Comment.new
    @vehicle = Vehicle.find_by id: params[:id]
    @comments = @vehicle.comments.parent_comments
    return if @vehicle
    flash[:danger] = t ".cant_find"
    redirect_to root_path
  end
end
