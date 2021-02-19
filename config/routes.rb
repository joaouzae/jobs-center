Rails.application.routes.draw do
  root 'home#index'
  devise_for :employees, controllers: { registrations: "registrations" }
  # devise_for :applicant, controllers: { registrations: "registrations" }
  devise_for :applicants
  
  namespace :employee do
    resources :vacancies
  end


end
