class Admin::CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :authentication_validation
  layout :admin_layout

  def index
    @companies = Company.where(user_id: current_user.id)
  end

  def new
    @users = User.all
    @company = Company.new
    @company_form_url = admin_companies_path
  end

  def create
    @users = User.all
    @company = Company.new(company_params)
    @company_form_url = admin_companies_path

    # if save record success
    if @company.save
      flash[:success] = "company #{@company.name} had been created successfully."
      redirect_to admin_companies_path
      return
    else
      @error_messages = @company
      render 'new'
      return
    end
  end

  def edit
    # find record with an id params
    @users = User.all
    @companies = Company.all
    @company = Company.find_by_id(params[:id])
    @company_user_id = Company.find_by(user_id: current_user.id)

    unless @company_user_id != current_user.id
      flash[:warning] = "You're not a company's owner!"
      redirect_to admin_users_dashboard_path
      return
    end

    unless @company
      flash[:error] = "Company not found with an id ##{params[:id]}"
      redirect_to admin_companies_path
      return
    end

    @company_method = "PATCH"
    @company_form_url = admin_company_path(@company.id)
  end

  # update department
  def update
    # find record with an id params
    @users = User.all
    @company = Company.find_by_id(params[:id])

    unless @company
      flash[:error] = "Branch not found with an id ##{params[:id]}"
      redirect_to admin_companies_path
      return
    end

    @company_method = "PATCH"
    @company_form_url = admin_company_path(@company.id)

    # if update record success
    if @company.update(company_params)
      flash[:success] = "Company #{@company.name} had been updated successfully."
      redirect_to admin_companies_path
      return
    else
      @error_messages = @company
      render 'edit'
      return
    end
  end

  def show
    # find record with an id params
    @company = Company.find_by_id(params[:id])

    unless @company
      flash[:error] = "Company not found with an id ##{params[:id]}"
      redirect_to admin_companies_path
      return
    end
    
    @branches = Branch.where(company_id: @company.id)
  end

  def destroy
    # find record with an id params
    @company = Company.find_by_id(params[:id])

    unless @company
      flash[:error] = "Company not found with an id ##{params[:id]}"
      redirect_to admin_companies_path
      return
    end

    @company.destroy
    flash[:success] = "Company with an id ##{params[:id]} has been deleted"
    redirect_to admin_companies_path

  end
  private

  def company_params
    params.require(:company).permit(:name, :website, :email, :phone, :address, :description, :status, :user_id)
  end
end
