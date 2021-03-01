class ApplicantsController < ApplicationController
  def index
  end

  def show
    @applicant = Applicant.find(params[:id])
  end

  def edit
    @applicant = Applicant.find(params[:id])
  end
  
  def update
    @applicant = Applicant.find(params[:id])
    
    
    if @applicant.update(applicant_params())
      redirect_to @applicant
    else
      render :edit
    end
  end

  private
    def applicant_params
      params.require(:applicant).permit(:name, :cpf, 
                                        :phone, :bio)
    end
end