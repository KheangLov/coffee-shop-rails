class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authentication_validation
  layout :admin_layout

  def dashboard
    @alerted_stock = Stock.where(alerted: true, status: APP::ACTIVE)
    @alerted_count = @alerted_stock.count
  end

  def index
    @users = User.order('created_at')
  end

  def new
    @roles = Role.all
    @user = User.new
    @user_form_url = admin_users_path
  end

  def create
    @roles = Role.all
    @user = User.new(user_params)
    @user_form_url = admin_users_path

    # if save record success
    if @user.save
      flash[:success] = "User #{@user.username} had been created successfully."
      redirect_to admin_users_path
      return
    else
      @error_messages = @user
      render 'index'
      return
    end
  end

  def edit
    # find record with an id params
    @roles = Role.all
    @users = User.where(role_id: @roles.ids)
    @user = User.find_by_id(params[:id])

    unless @user
      flash[:error] = "User not found with an id ##{params[:id]}"
      redirect_to admin_users_path
      return
    end

    @user_method = "PATCH"
    @user_form_url = admin_user_path(@user.id)
  end

  # update department
  def update
    # find record with an id params
    @roles = Role.all
    @user = User.find_by_id(params[:id])

    unless @user
      flash[:error] = "User not found with an id ##{params[:id]}"
      redirect_to admin_users_path
      return
    end

    @user_method = "PATCH"
    @user_form_url = admin_user_path(@user.id)

    # if update record success
    if @user.update(user_without_password_params)
      flash[:success] = "User #{@user.username} had been updated successfully."
      redirect_to admin_users_path
      return
    else
      @error_messages = @user
      render 'edit'
      return
    end
  end

  def show
    # find record with an id params
    @user = User.find_by_id(params[:id])

    unless @user
      flash[:error] = "User not found with an id ##{params[:id]}"
      redirect_to admin_users_path
      return
    end
  end

  def destroy
    # find record with an id params
    @user = User.find_by_id(params[:id])

    unless @user
      flash[:error] = "User not found with an id ##{params[:id]}"
      redirect_to admin_users_path
      return
    end

    @user.destroy
    flash[:success] = "User with an id ##{params[:id]} has been deleted"
    redirect_to admin_users_path

  end

  private

  def user_without_password_params
    params.require(:user).permit(:email, :gender, :username, :role_id, :status)
  end

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:email, :gender, :username, :password, :password_confirmation, :role_id, :status)
  end
end
