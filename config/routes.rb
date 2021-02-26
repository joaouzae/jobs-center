Rails.application.routes.draw do
  root 'home#index'
  
  namespace :employee do
    resources :vacancies
  end
  
  namespace :applicant do
    resources :vacancies
  end
  
  namespace :visitor do
    resources :vacancies
  end

  resources :companies, except: %i[index]
  devise_for :employees, controllers: { registrations: "registrations" }
  # devise_for :applicant, controllers: { registrations: "registrations" }
  devise_for :applicants
  


end
