class Employee < ApplicationRecord
  has_many :vacancies

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
