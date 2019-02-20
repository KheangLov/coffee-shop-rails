class Admin::EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :authentication_validation
  layout :admin_layout

  def index
    @employees = Employee.all
  end
end
