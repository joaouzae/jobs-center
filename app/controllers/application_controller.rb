class ApplicationController < ActionController::Base
  devise_group :user, contains: [:employee, :applicant]
end
