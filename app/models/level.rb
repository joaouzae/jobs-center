class Level < ApplicationRecord
  has_many :vacancies
  # has_many :level_vacancies
  # has_many :vacancies, through: :level_vacancies
end
