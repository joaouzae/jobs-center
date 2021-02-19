# este é o arquivo que redireciona a partir do sign_up do candidato
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    
  end
end