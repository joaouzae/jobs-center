Rails.application.routes.draw do
  root 'home#index'
  
  namespace :employee do
    # resources :vacancies do
    #   get 'company_vacancies_index', on: :collection
    # end
    resources :vacancies
  end
  
  namespace :company do
    resources :vacancies, only: %i[index]
  end

  namespace :applicant do
    resources :vacancies
  end
  
  namespace :visitor do
    resources :vacancies
  end

  resources :companies, except: %i[index]
  
  
  devise_for :employees, controllers: { registrations: "employee/registrations" }
  devise_for :applicants, controllers: { registrations: "applicant/registrations"}
  
  resources :applicants, except: %i[create new]
  


end
