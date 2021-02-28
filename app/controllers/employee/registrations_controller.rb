class Employee::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    domain = resource.email.split('@').last
    # unless self.is_personal?(domain)
      # se for o primeiro funcionário da empresa
    unless Employee.last.member?
      # redirecionar para página de criar empresa
      new_company_path
    else
      root_path
    end
  end

  def is_personal?(domain)
    personal_domains = ['hotmail.com', 'gmail.com']
    personal_domains.include?(domain)
  end
end
