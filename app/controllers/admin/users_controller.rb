class Admin::UsersController < ApplicationController
	layout "admin/application"
	before_action :find_user, only: %i(show edit update)
	
	def show; end

  def edit; end

	def update
		debugger
    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to admin_user_path @user.id
    else
      flash[:danger] = t ".fails"
      render "admin/users/form"
    end
  end

  private

  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def find_user
    @user = User.find_by id: params[:id]

    return if @user
    flash[:danger] = t ".cant_find"
    redirect_to root_url
  end
end
