Rails.application.routes.draw do
  # devise_for :applicants
  root 'home#index'
  
  # devise_for :applicants, path: 'applicants'
  # devise_for :employees, path: 'employees'
  # devise_for :employees, controllers: { registrations: "registrations" }
  # devise_for :applicant, controllers: { registrations: "registrations" }
  # resources :vacancies

end
