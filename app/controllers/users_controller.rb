class UsersController < ApplicationController
  before_action :find_user, only: %i(show edit update)

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      log_in @user
      flash[:success] = t ".wel"
      redirect_to root_url
    else
      flash[:danger] = t ".signup_err"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".success"
      redirect_to @user
    else
      flash[:danger] = t ".fails"
      render "users/form"
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
