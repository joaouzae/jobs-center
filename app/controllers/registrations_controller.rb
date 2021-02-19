# esse arquivo é só para funcionários.
# é para ver se a empresa já existe
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    # if resource.email.split('@').last == 'campuscode.com.br'
      # se não existir a empresa
      
      # redirecionar para página de criar empresa
    # else
      # redirecionar para o show
    # end
  end
end