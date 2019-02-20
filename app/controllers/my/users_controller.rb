class My::UsersController < ApplicationController
  before_action :authenticate_user!
  layout :my_layout

  def dashboard
    @alerted_stock = Stock.where(alerted: true, status: APP::ACTIVE)
    @alerted_count = @alerted_stock.count
  end
end
