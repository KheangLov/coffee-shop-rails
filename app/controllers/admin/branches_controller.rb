class Admin::BranchesController < ApplicationController
  before_action :authenticate_user!
  before_action :authentication_validation
  layout :admin_layout

  def index
    @branches = Branch.all
  end

  def new
    @companies = Company.all
    @branch = Branch.new
    @branch_form_url = admin_branches_path
  end

  def create
    @companies = Company.all
    @branch = Branch.new(branch_params)
    @branch_form_url = admin_branches_path

    # if save record success
    if @branch.save
      flash[:success] = "Branch #{@branch.name} had been created successfully."
      redirect_to admin_branches_path
      return
    else
      @error_messages = @branch
      render 'new'
      return
    end
  end

  def edit
    # find record with an id params
    @companies = Company.all
    @branches = Branch.all
    @branch = Branch.find_by_id(params[:id])

    unless @branch
      flash[:error] = "Branch not found with an id ##{params[:id]}"
      redirect_to admin_branches_path
      return
    end

    @branch_method = "PATCH"
    @branch_form_url = admin_branch_path(@branch.id)
  end

  # update department
  def update
    # find record with an id params
    @companies = Company.all
    @branch = Branch.find_by_id(params[:id])

    unless @branch
      flash[:error] = "Branch not found with an id ##{params[:id]}"
      redirect_to admin_branches_path
      return
    end

    @branch_method = "PATCH"
    @branch_form_url = admin_branch_path(@branch.id)

    # if update record success
    if @branch.update(branch_params)
      flash[:success] = "Branch #{@branch.name} had been updated successfully."
      redirect_to admin_branches_path
      return
    else
      @error_messages = @branch
      render 'edit'
      return
    end
  end

  def show
    # find record with an id params
    @branch = Branch.find_by_id(params[:id])

    unless @branch
      flash[:error] = "Branch not found with an id ##{params[:id]}"
      redirect_to admin_branches_path
      return
    end
  end

  private

  def branch_params
    params.require(:branch).permit(:name, :description, :address, :phone, :email, :company_id)
  end
end
