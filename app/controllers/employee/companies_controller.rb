class Employee::CompaniesController < ApplicationController
  before_action :authenticate_employee!

  def index
  end

  def new
    Company.new
  end

  def create
    @company = Company.new(company_params())

    if @company.save
      redirect_to @company
      
    else
      render 'new'
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :address, :cnpj, :site)
  end