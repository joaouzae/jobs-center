# esse arquivo é só para funcionários.
# é para ver se a empresa já existe
class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    domain = resource.email.split('@').last
    unless self.is_personal?(domain)
      # se não existir a empresa
      unless Company.find_by(domain: domain)
        # redirecionar para página de criar empresa
        new_company_path
        # return
      else
        new_company_path #alterar isso mais tarde
      end
    # else
      # redirecionar para o show
    # end
   end
  end

  def is_personal?(domain)
    personal_domains = ['hotmail.com', 'google.com']
    personal_domains.include?(domain)
  end
end
