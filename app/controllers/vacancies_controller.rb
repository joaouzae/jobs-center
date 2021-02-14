class VancanciesController < ApplicationController
  def index
  end

  def show
    @vacancy = Vancancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    # vacancy_params = vacancy_params
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.user = current_user

    if @vacancy.save
      redirect_to @vacancy
    else
      render 'new' 
    end
  end

  def edit
    @vacancy = Vacancy.find(params[:id])
  end

  def update
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