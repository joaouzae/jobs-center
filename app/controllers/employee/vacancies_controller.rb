class Employee::VacanciesController < ApplicationController
  # before_action :authenticate_employee!

  def index
    @vacancies = Vacancy.all
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    authenticate_employee!
    @vacancy = Vacancy.new
  end

  def create
    authenticate_employee!
    # if current_user is not of type Employee, don't allow them to proceed.
    # if current_user.class != Employee:
    @vacancy = Vacancy.new(vacancy_params())
    @vacancy.employee = current_user

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
    authenticate_employee!
    @vacancy = Vacancy.find(params[:id])
    # vacancy_params = vacancy_params
    if @vacancy.update(vacancy_params)
      redirect_to @vacancy
    else
      render :edit
    end
  end

  private
    def vacancy_params
      params.require(:vacancy).permit(:title, :description, :salary_range, :level,
                                      :requirements, :expiration_date, :quantity)
    end


end