class My::ProductCategoriesController < ApplicationController
  before_action :authenticate_user!
  layout :my_layout

  def index
    @stock_categories = StockCategory.all
    @stock_category_form_url = admin_stock_categories_path
  end

  def new
    @branches = Branch.all
    @stock_categories = StockCategory.all
    @stock_category = StockCategory.new
    @stock_category_form_url = admin_stock_categories_path
  end


  def create
    @branches = Branch.all
    @stock_categories = StockCategory.all
    @stock_category = StockCategory.new(stock_category_params)
    @stock_category_form_url = admin_stock_categories_path

    # if save record success
    if @stock_category.save
      flash[:success] = "Stock Category #{@stock_category.name} had been created successfully."
      redirect_to admin_stock_categories_path
      return
    else
      @error_messages = @stock_category
      render 'index'
      return
    end
  end

  def edit
    # find record with an id params
    @stock_categories = StockCategory.where(branch_id: @branches.ids)
    @stock_category = StockCategory.find_by_id(params[:id])

    @branches = Branch.all

    unless @stock_category
      flash[:error] = "Stock Category not found with an id ##{params[:id]}"
      redirect_to admin_stock_categories_path
      return
    end

    @stock_category_method = "PATCH"
    @stock_category_form_url = admin_stock_categories_path(@stock_category.id)
  end

  # update department
  def update
    # find record with an id params
    @stock_category = StockCategory.find_by_id(params[:id])

    unless @stock_category
      flash[:error] = "Stock Category not found with an id ##{params[:id]}"
      redirect_to admin_stock_categories_path
      return
    end

    @stock_category_method = "PATCH"
    @stock_category_form_url = admin_stock_categories_path(@stock_category.id)

    # if update record success
    if @stock_category.update(stock_category_params)
      flash[:success] = "Stock Category #{@stock_category.name} had been updated successfully."
      redirect_to admin_stock_categories_path
      return
    else
      @error_messages = @stock_category
      render 'edit'
      return
    end
  end

  # def show
  #   # find record with an id params
  #   @stock_category = StockCategory.find_by_id(params[:id])
  #   @stock_categories = StockCategory.where("id = ?", params[:id])

  #   unless @stock_category
  #     flash[:error] = "Stock Category not found with an id ##{params[:id]}"
  #     redirect_to admin_stock_categories_path
  #     return
  #   end
  # end

  def destroy
    # find record with an id params
    @stock_category = StockCategory.find_by_id(params[:id])

    unless @stock_category
      flash[:error] = "Stock Category not found with an id ##{params[:id]}"
      redirect_to admin_stock_categories_path
      return
    end

    @stock_category.destroy
    flash[:success] = "Stock Category with an id ##{params[:id]} has been deleted"
    redirect_to admin_stock_categories_path

  end

  private

  def stock_category_params
    params.require(:stock_category).permit(:name, :description, :branch_id)
  end
end
