class Admin::StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :authentication_validation
  layout :admin_layout

  def index
    @stocks = Stock.all
    @stock_categories = StockCategory.all
    @alerted_stock = Stock.where(alerted: true, status: APP::ACTIVE)
    @alerted_count = @alerted_stock.count
    @filter_param  = params[:filter]
    @query_param = params[:query]
  end

  def new
    @branches = Branch.all
    @stock_categories = StockCategory.all
    @stocks = Stock.all
    @stock = Stock.new
    @stock_form_url = admin_stocks_path
  end


  def create
    @branches = Branch.all
    @stock_categories = StockCategory.all
    @stock = Stock.new(stock_params)
    @stock_form_url = admin_stocks_path

    # if save record success
    if @stock.save
      flash[:success] = "Stock #{@stock.name} had been created successfully."
      redirect_to admin_stocks_path
      return
    else
      @error_messages = @stock
      render 'new'
      return
    end
  end

  def edit
    # find record with an id params
    @branches = Branch.all
    @stock_categories = StockCategory.all
    @stock = Stock.find_by_id(params[:id])

    unless @stock
      flash[:error] = "Stock not found with an id ##{params[:id]}"
      redirect_to admin_stocks_path
      return
    end

    @stock_method = "PATCH"
    @stock_form_url = admin_stock_path(@stock.id)
  end

  # update department
  def update
    # find record with an id params
    @branches = Branch.all
    @stock_categories = StockCategory.all
    @stock = Stock.find_by_id(params[:id])

    unless @stock
      flash[:error] = "Stock not found with an id ##{params[:id]}"
      redirect_to admin_stocks_path
      return
    end

    @stock_method = "PATCH"
    @stock_form_url = admin_stock_path(@stock.id)

    # if update record success
    if @stock.update(stock_params)
      flash[:success] = "Stock #{@stock.name} had been updated successfully."
      redirect_to admin_stocks_path
      return
    else
      @error_messages = @stock
      render 'edit'
      return
    end
  end

  def show
    # find record with an id params
    @stock = Stock.find_by_id(params[:id])
    @stock_price = "$" + @stock.price.to_s
    @stock_sale_price = "$" + @stock.sale_price.to_s

    unless @stock
      flash[:error] = "Stock not found with an id ##{params[:id]}"
      redirect_to admin_stocks_path
      return
    end
  end

  def destroy
    # find record with an id params
    @stock = Stock.find_by_id(params[:id])

    unless @stock
      flash[:error] = "Stock not found with an id ##{params[:id]}"
      redirect_to admin_stocks_path
      return
    end

    @stock.destroy
    flash[:success] = "Stock with an id ##{params[:id]} has been deleted"
    redirect_to admin_stocks_path

  end

  private

  def stock_params
    params.require(:stock).permit(:name, :stock_category_id, :branch_id, :expired_date, :qty, :alerted, :alert_qty, :price, :sale_price, :description, :status)
  end
end
