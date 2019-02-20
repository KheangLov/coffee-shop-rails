class My::CompaniesController < ApplicationController
  before_action :authenticate_user!
  layout :my_layout

  def index
    @companies = Company.all
  end
end
