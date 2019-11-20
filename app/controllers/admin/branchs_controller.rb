class Admin::BranchsController < ApplicationController
  layout "admin/application"

  def index
    @branchs = Branch.all
    @branch = Branch.new
  end

  def create
    @branch = Branch.new branch_params

    if @branch.save
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".fails"
    end
    redirect_to admin_branchs_path
  end

  def destroy
    @branch = Branch.find_by id: params[:id]
    @branch.destroy

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def branch_params
    params.require(:branch).permit Branch::BRANCH_PARAMS
  end
end
