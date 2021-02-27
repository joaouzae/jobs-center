class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(employee_params())

    if @employee.save
      redirect_to [:employee, @employee]
    else
      render 'new' 
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:title, :description, :salary_bottom, :salary_top, :level,
                                      :requirements, :expiration_date, :quantity)
    end
end