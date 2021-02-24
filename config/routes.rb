Rails.application.routes.draw do
  root 'home#index'
  namespace :employee do
    resources :vacancies
  end
  resources :companies
  devise_for :employees
  # devise_for :applicant, controllers: { registrations: "registrations" }
  devise_for :applicants
  


end
