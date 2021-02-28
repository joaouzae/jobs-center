#leva o candidato para a página de preencher o perfil
class Applicant::RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    edit_applicant_path(resource.id)
  end

  def is_personal?(domain)
    personal_domains = ['hotmail.com', 'google.com']
    personal_domains.include?(domain)
  end
end
