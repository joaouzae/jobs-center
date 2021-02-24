# esse arquivo é só para funcionários.
# é para ver se a empresa já existe
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.email.split('@').last == 'campuscode.com.br'
      # se não existir a empresa
      unless Company.find_by(email: email)
        # redirecionar para página de criar empresa
        redirect_to new_company_path
      end
    # else
      # redirecionar para o show
    # end
  end
end