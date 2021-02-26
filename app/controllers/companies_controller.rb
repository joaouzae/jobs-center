class CompaniesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @company = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.last
    @company.update(company_params())

    if @company.save
      redirect_to @company
      
    else
      render 'new'
    end
  end

  def edit
    @company = Company.find(params[:id])
  end
  
  def update
    @company = Company.find(params[:id])
    
    
    if @company.update(company_params())
      redirect_to @company
    else
      render :edit
    end
  end

  private
  def company_params
    params.require(:company).permit(:name, :address, :cnpj, :site)
  end
end