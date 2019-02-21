class My::ProductCategoriesController < ApplicationController
  before_action :authenticate_user!
  layout :my_layout

  def index
  end
end
