class Employee::VacanciesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @vacancies = Vacancy.all
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params())
    @vacancy.employee = current_employee

    if @vacancy.save
      redirect_to @vacancy
    else
      @levels = Levels.all
      render 'new' 
    end
  end

  def edit
    authenticate_employee!
    @vacancy = Vacancy.find(params[:id])
  end

  def update
    @vacancy = Vacancy.find(params[:id])

    if @vacancy.update(vacancy_params())
      redirect_to @vacancy
    else
      render :edit
    end
  end

  private
    def vacancy_params
      params.require(:vacancy).permit(:title, :description, :salary_bottom, :salary_top, :level,
                                      :requirements, :expiration_date, :quantity)
    end


end